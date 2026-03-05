#!/usr/bin/env python3
"""Sync client upload list and artifacts from plasma-ios releases."""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Tuple
from urllib import error, parse, request


DEFAULT_SOURCE_OWNER = "salute-developers"
DEFAULT_SOURCE_REPO = "plasma-ios"
DEFAULT_MANIFEST_FILE = "release-manifest.json"
DEFAULT_CONFIG_PATH = "~/.plasma-release-sync.json"
DEFAULT_MANIFEST_SCHEMA_FILE = "release-manifest.schema.json"
DEFAULT_THIRD_PARTY_SCHEMA_FILE = "scripts/schemas/third_party_upload_list.schema.json"
DEFAULT_MONO_SCHEMA_FILE = "scripts/schemas/mono_dependencies.schema.json"
DEFAULT_GITLAB_URL = "https://gitlab.com"
DEFAULT_BRANCH_TEMPLATE = "chore/sync-plasma-{release_tag}"
DEFAULT_COMMIT_TEMPLATE = "chore: sync plasma artifacts {release_tag}"
DEFAULT_MR_TITLE_TEMPLATE = "chore: sync plasma artifacts {release_tag}"
DEFAULT_MR_BODY_TEMPLATE = (
    "Automated sync for `{release_tag}`.\n\n"
    "Updated upload list versions and downloaded framework archives."
)


class SyncError(RuntimeError):
    """Script-level error."""


@dataclass
class Library:
    name: str
    version: str
    asset_file_name: str
    download_url: str
    release_tag: str


@dataclass
class ReleaseAsset:
    release_tag: str
    download_url: str


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        prog="release_sync",
        description=(
            "Скрипт синхронизации библиотек Plasma для клиентских репозиториев.\n"
            "Режим по умолчанию: third-party."
        ),
        epilog=(
            "Переменные окружения:\n"
            "  GITLAB_TOKEN   (обязательная, токен GitLab с scope api)\n"
            "  GITHUB_TOKEN   (опционально, для GitHub API)\n"
            "  GITLAB_URL     (опционально, по умолчанию https://gitlab.com)\n\n"
            "Кэш настроек:\n"
            "  По умолчанию: ~/.plasma-release-sync.json\n"
            "  Переопределить: --config-path /path/to/config.json\n"
            "  В кэше сохраняются введенные параметры для режимов third-party и mono.\n\n"
            "Примеры:\n"
            "  python3 scripts/release_sync/release_sync.py\n"
            "  python3 scripts/release_sync/release_sync.py --mode mono\n"
            "  python3 scripts/release_sync/release_sync.py --dry-run"
        ),
        formatter_class=argparse.RawTextHelpFormatter,
    )
    parser.add_argument(
        "--mode",
        choices=["third-party", "mono"],
        default=None,
        help="Режим: third-party (upload_list + артефакты) или mono (только YAML).",
    )
    parser.add_argument("--release-tag", help="Тег-релиз якорь для поиска артефактов.")
    parser.add_argument("--repo-path", help="Путь к локальному git-репозиторию клиента.")
    parser.add_argument("--upload-list-path", help="Путь к upload_list.sh (third-party).")
    parser.add_argument("--artifacts-dir", help="Папка для скачивания zip-артефактов (third-party).")
    parser.add_argument(
        "--mono-yaml-path",
        help="Путь к YAML-файлу зависимостей (mono).",
    )
    parser.add_argument("--target-branch", help="Целевая ветка для MR (куда мержим).", default=None)
    parser.add_argument("--branch-name", help="Имя source-ветки для commit/push.", default=None)
    parser.add_argument("--commit-message", help="Сообщение коммита.", default=None)
    parser.add_argument(
        "--config-path",
        help="Путь к файлу кэша настроек.",
        default=DEFAULT_CONFIG_PATH,
    )
    parser.add_argument("--manifest-path", help="Путь к локальному release-manifest.json.", default=None)
    parser.add_argument("--manifest-schema-path", help="Путь к схеме manifest (override).", default=None)
    parser.add_argument(
        "--third-party-schema-path",
        help="Путь к схеме third-party (override).",
        default=None,
    )
    parser.add_argument("--mono-schema-path", help="Путь к схеме mono (override).", default=None)
    parser.add_argument("--manifest-ref", help="Git ref для manifest/schemas из GitHub.", default="main")
    parser.add_argument("--manifest-url", help="Полный URL до manifest JSON.", default=None)
    parser.add_argument("--source-owner", help="GitHub owner исходного репозитория.", default=DEFAULT_SOURCE_OWNER)
    parser.add_argument("--source-repo", help="GitHub repo исходного репозитория.", default=DEFAULT_SOURCE_REPO)
    parser.add_argument("--gitlab-url", help="Базовый URL GitLab.", default=os.getenv("GITLAB_URL", DEFAULT_GITLAB_URL))
    parser.add_argument("--gitlab-project-id", help="ID проекта GitLab (число или group%%2Frepo).", default=os.getenv("GITLAB_PROJECT_ID"))
    parser.add_argument("--non-interactive", action="store_true", help="Без вопросов в интерактиве.")
    parser.add_argument("--dry-run", action="store_true", help="Только показать изменения, без записи/пуша.")
    return parser.parse_args()


def main() -> int:
    try:
        args = parse_args()
        run(args)
        return 0
    except KeyboardInterrupt:
        print("\nInterrupted.")
        return 130
    except SyncError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1


def run(args: argparse.Namespace) -> None:
    print("Plasma release sync utility")
    print("==========================")

    config_path = Path(args.config_path).expanduser().resolve()
    saved_config = load_sync_config(config_path)
    mode = ask_if_missing(
        args.mode or saved_config.get("mode"),
        "Mode (third-party/mono)",
        default="third-party",
        non_interactive=args.non_interactive,
    ).strip()
    if mode not in {"third-party", "mono"}:
        raise SyncError(f"Unsupported mode: {mode}")
    args.manifest_schema_path = args.manifest_schema_path or saved_config.get("manifest_schema_path")
    args.third_party_schema_path = args.third_party_schema_path or saved_config.get("third_party_schema_path")
    args.mono_schema_path = args.mono_schema_path or saved_config.get("mono_schema_path")
    save_sync_config(
        config_path=config_path,
        data={
            "mode": mode,
            "manifest_schema_path": normalize_optional_path(args.manifest_schema_path),
            "third_party_schema_path": normalize_optional_path(args.third_party_schema_path),
            "mono_schema_path": normalize_optional_path(args.mono_schema_path),
        },
    )
    print(f"Selected mode: {mode}")

    if mode == "mono":
        run_mono_mode(args=args, config_path=config_path, saved_config=saved_config)
        return

    run_third_party_mode(args=args, config_path=config_path, saved_config=saved_config)


def run_third_party_mode(
    args: argparse.Namespace,
    config_path: Path,
    saved_config: Dict[str, str],
) -> None:

    args.repo_path = ask_if_missing(
        args.repo_path
        or saved_config.get("third_party_repo_path")
        or saved_config.get("repo_path"),
        "Path to client git repository",
        required=True,
        non_interactive=args.non_interactive,
    )
    repo_path = Path(args.repo_path).expanduser().resolve()
    ensure_git_repo(repo_path)

    args.upload_list_path = ask_if_missing(
        args.upload_list_path
        or saved_config.get("third_party_upload_list_path")
        or saved_config.get("upload_list_path"),
        "Path to upload_list.sh",
        required=True,
        non_interactive=args.non_interactive,
    )
    upload_list_path = Path(args.upload_list_path).expanduser().resolve()
    if not upload_list_path.exists():
        raise SyncError(f"upload list file not found: {upload_list_path}")

    args.artifacts_dir = ask_if_missing(
        args.artifacts_dir
        or saved_config.get("third_party_artifacts_dir")
        or saved_config.get("artifacts_dir"),
        "Path to artifacts directory",
        required=True,
        non_interactive=args.non_interactive,
    )
    artifacts_dir = Path(args.artifacts_dir).expanduser().resolve()
    if not args.dry_run:
        artifacts_dir.mkdir(parents=True, exist_ok=True)

    args.target_branch = ask_if_missing(
        args.target_branch
        or saved_config.get("third_party_target_branch")
        or saved_config.get("target_branch"),
        "Target branch for MR",
        default="develop",
        non_interactive=args.non_interactive,
    )
    args.release_tag = ask_if_missing(
        args.release_tag
        or saved_config.get("third_party_release_tag")
        or saved_config.get("release_tag"),
        "Release tag anchor (or 'latest')",
        default="latest",
        non_interactive=args.non_interactive,
    )
    args.gitlab_project_id = ask_if_missing(
        args.gitlab_project_id
        or saved_config.get("third_party_gitlab_project_id")
        or saved_config.get("gitlab_project_id"),
        "GitLab project id (numeric id or group%2Frepo path)",
        required=True,
        non_interactive=args.non_interactive,
    )

    github_token = os.getenv("GITHUB_TOKEN", "").strip()
    gitlab_token = os.getenv("GITLAB_TOKEN", "").strip()
    if not gitlab_token:
        raise SyncError("GITLAB_TOKEN is required")
    manifest_schema = load_schema_definition(
        local_path=args.manifest_schema_path,
        fallback_repo_path=DEFAULT_MANIFEST_SCHEMA_FILE,
        args=args,
        github_token=github_token,
        label="manifest schema",
    )
    third_party_schema = load_schema_definition(
        local_path=args.third_party_schema_path,
        fallback_repo_path=DEFAULT_THIRD_PARTY_SCHEMA_FILE,
        args=args,
        github_token=github_token,
        label="third-party schema",
    )

    save_sync_config(
        config_path=config_path,
        data={
            "third_party_repo_path": str(repo_path),
            "third_party_upload_list_path": str(upload_list_path),
            "third_party_artifacts_dir": str(artifacts_dir),
            "third_party_release_tag": args.release_tag,
            "third_party_gitlab_project_id": args.gitlab_project_id,
            "third_party_target_branch": args.target_branch,
            "gitlab_url": args.gitlab_url,
            "source_owner": args.source_owner,
            "source_repo": args.source_repo,
            "manifest_ref": args.manifest_ref,
        },
    )

    preflight_git(repo_path)

    print("\nLoading release manifest...")
    manifest = load_manifest(args, github_token)
    validate_json_schema(
        data=manifest,
        schema=manifest_schema,
        label="release-manifest",
    )
    libraries = [to_library(item) for item in manifest.get("libraries", [])]
    if not libraries:
        raise SyncError("Manifest has no libraries")

    print("Resolving asset URLs from releases...")
    resolved_libraries, resolved_tag = resolve_libraries_with_fallback(
        libraries=libraries,
        owner=args.source_owner,
        repo=args.source_repo,
        github_token=github_token,
        anchor_release_tag=args.release_tag,
    )
    print_resolution_log(resolved_libraries)

    upload_relative = relpath(upload_list_path, repo_path)
    artifacts_relative = relpath(artifacts_dir, repo_path)

    changed_versions = update_upload_list(
        upload_list_path=upload_list_path,
        libraries=resolved_libraries,
        schema=third_party_schema,
        dry_run=args.dry_run,
    )
    downloaded = download_artifacts(
        artifacts_dir=artifacts_dir,
        libraries=resolved_libraries,
        github_token=github_token,
        dry_run=args.dry_run,
    )

    if args.dry_run:
        print_summary(changed_versions, downloaded, dry_run=True)
        return

    template_context = build_template_context(args.release_tag, resolved_tag)
    default_branch_name = render_template(
        os.getenv("SYNC_BRANCH_TEMPLATE", DEFAULT_BRANCH_TEMPLATE), template_context
    )
    branch_name = ask_if_missing(
        args.branch_name,
        "Branch name for commit/MR",
        default=default_branch_name,
        non_interactive=args.non_interactive,
    )
    commit_message = render_template(
        os.getenv("SYNC_COMMIT_TEMPLATE", DEFAULT_COMMIT_TEMPLATE), template_context
    )
    commit_message = ask_if_missing(
        args.commit_message,
        "Commit message",
        default=commit_message,
        non_interactive=args.non_interactive,
    )
    mr_title = render_template(
        os.getenv("SYNC_MR_TITLE_TEMPLATE", DEFAULT_MR_TITLE_TEMPLATE), template_context
    )
    mr_body = render_template(
        os.getenv("SYNC_MR_BODY_TEMPLATE", DEFAULT_MR_BODY_TEMPLATE), template_context
    )

    changed_files = git_commit_and_push(
        repo_path=repo_path,
        target_branch=args.target_branch,
        branch_name=branch_name,
        stage_paths=[upload_relative, artifacts_relative],
        commit_message=commit_message,
        non_interactive=args.non_interactive,
    )
    if not changed_files:
        print_summary(changed_versions, downloaded, dry_run=False)
        print("\nNo git changes detected, MR was not created.")
        return

    if not ask_yes_no(
        "Open Merge Request now?",
        default=True,
        non_interactive=args.non_interactive,
    ):
        print_summary(changed_versions, downloaded, dry_run=False)
        print(
            "\nChanges were pushed, MR creation skipped.\n"
            f"Source branch: {branch_name}\nTarget branch: {args.target_branch}"
        )
        return

    mr_url = create_gitlab_mr(
        gitlab_url=args.gitlab_url,
        project_id=args.gitlab_project_id,
        private_token=gitlab_token,
        source_branch=branch_name,
        target_branch=args.target_branch,
        title=mr_title,
        description=mr_body,
    )

    print_summary(changed_versions, downloaded, dry_run=False)
    print(f"\nCreated GitLab MR: {mr_url}")


def run_mono_mode(
    args: argparse.Namespace,
    config_path: Path,
    saved_config: Dict[str, str],
) -> None:
    args.repo_path = ask_if_missing(
        args.repo_path
        or saved_config.get("mono_repo_path")
        or saved_config.get("repo_path"),
        "Path to mono git repository",
        required=True,
        non_interactive=args.non_interactive,
    )
    repo_path = Path(args.repo_path).expanduser().resolve()
    ensure_git_repo(repo_path)

    args.mono_yaml_path = ask_if_missing(
        args.mono_yaml_path or saved_config.get("mono_yaml_path"),
        "Path to mono dependencies YAML",
        required=True,
        non_interactive=args.non_interactive,
    )
    mono_yaml_path = Path(args.mono_yaml_path).expanduser().resolve()
    if not mono_yaml_path.exists():
        raise SyncError(f"mono yaml file not found: {mono_yaml_path}")

    args.target_branch = ask_if_missing(
        args.target_branch
        or saved_config.get("mono_target_branch")
        or saved_config.get("target_branch"),
        "Target branch for MR",
        default="develop",
        non_interactive=args.non_interactive,
    )
    args.release_tag = ask_if_missing(
        args.release_tag
        or saved_config.get("mono_release_tag")
        or saved_config.get("release_tag"),
        "Release tag anchor (or 'latest')",
        default="latest",
        non_interactive=args.non_interactive,
    )
    args.gitlab_project_id = ask_if_missing(
        args.gitlab_project_id
        or saved_config.get("mono_gitlab_project_id")
        or saved_config.get("gitlab_project_id"),
        "GitLab project id (numeric id or group%2Frepo path)",
        required=True,
        non_interactive=args.non_interactive,
    )

    github_token = os.getenv("GITHUB_TOKEN", "").strip()
    gitlab_token = os.getenv("GITLAB_TOKEN", "").strip()
    if not gitlab_token:
        raise SyncError("GITLAB_TOKEN is required")
    manifest_schema = load_schema_definition(
        local_path=args.manifest_schema_path,
        fallback_repo_path=DEFAULT_MANIFEST_SCHEMA_FILE,
        args=args,
        github_token=github_token,
        label="manifest schema",
    )
    mono_schema = load_schema_definition(
        local_path=args.mono_schema_path,
        fallback_repo_path=DEFAULT_MONO_SCHEMA_FILE,
        args=args,
        github_token=github_token,
        label="mono schema",
    )

    save_sync_config(
        config_path=config_path,
        data={
            "mono_repo_path": str(repo_path),
            "mono_yaml_path": str(mono_yaml_path),
            "mono_release_tag": args.release_tag,
            "mono_gitlab_project_id": args.gitlab_project_id,
            "mono_target_branch": args.target_branch,
            "gitlab_url": args.gitlab_url,
            "source_owner": args.source_owner,
            "source_repo": args.source_repo,
            "manifest_ref": args.manifest_ref,
        },
    )

    preflight_git(repo_path)

    print("\nLoading release manifest...")
    manifest = load_manifest(args, github_token)
    validate_json_schema(
        data=manifest,
        schema=manifest_schema,
        label="release-manifest",
    )
    libraries = [to_library(item) for item in manifest.get("libraries", [])]
    if not libraries:
        raise SyncError("Manifest has no libraries")

    print("Resolving asset URLs from releases...")
    resolved_libraries, resolved_tag = resolve_libraries_with_fallback(
        libraries=libraries,
        owner=args.source_owner,
        repo=args.source_repo,
        github_token=github_token,
        anchor_release_tag=args.release_tag,
    )
    print_resolution_log(resolved_libraries)

    yaml_relative = relpath(mono_yaml_path, repo_path)
    yaml_changes = update_mono_yaml(
        yaml_path=mono_yaml_path,
        libraries=resolved_libraries,
        source_owner=args.source_owner,
        source_repo=args.source_repo,
        mono_schema=mono_schema,
        dry_run=args.dry_run,
    )

    if args.dry_run:
        print_mono_summary(yaml_changes, dry_run=True)
        return

    template_context = build_template_context(args.release_tag, resolved_tag)
    default_branch_name = render_template(
        os.getenv("SYNC_BRANCH_TEMPLATE", DEFAULT_BRANCH_TEMPLATE), template_context
    )
    branch_name = ask_if_missing(
        args.branch_name,
        "Branch name for commit/MR",
        default=default_branch_name,
        non_interactive=args.non_interactive,
    )
    commit_message = render_template(
        os.getenv("SYNC_COMMIT_TEMPLATE", DEFAULT_COMMIT_TEMPLATE), template_context
    )
    commit_message = ask_if_missing(
        args.commit_message,
        "Commit message",
        default=commit_message,
        non_interactive=args.non_interactive,
    )
    mr_title = render_template(
        os.getenv("SYNC_MR_TITLE_TEMPLATE", DEFAULT_MR_TITLE_TEMPLATE), template_context
    )
    mr_body = render_template(
        os.getenv("SYNC_MR_BODY_TEMPLATE", DEFAULT_MR_BODY_TEMPLATE), template_context
    )

    changed_files = git_commit_and_push(
        repo_path=repo_path,
        target_branch=args.target_branch,
        branch_name=branch_name,
        stage_paths=[yaml_relative],
        commit_message=commit_message,
        non_interactive=args.non_interactive,
    )
    if not changed_files:
        print_mono_summary(yaml_changes, dry_run=False)
        print("\nNo git changes detected, MR was not created.")
        return

    if not ask_yes_no(
        "Open Merge Request now?",
        default=True,
        non_interactive=args.non_interactive,
    ):
        print_mono_summary(yaml_changes, dry_run=False)
        print(
            "\nChanges were pushed, MR creation skipped.\n"
            f"Source branch: {branch_name}\nTarget branch: {args.target_branch}"
        )
        return

    mr_url = create_gitlab_mr(
        gitlab_url=args.gitlab_url,
        project_id=args.gitlab_project_id,
        private_token=gitlab_token,
        source_branch=branch_name,
        target_branch=args.target_branch,
        title=mr_title,
        description=mr_body,
    )
    print_mono_summary(yaml_changes, dry_run=False)
    print(f"\nCreated GitLab MR: {mr_url}")


def ask_if_missing(
    value: Optional[str],
    prompt_text: str,
    default: Optional[str] = None,
    required: bool = False,
    non_interactive: bool = False,
) -> str:
    if value:
        return value

    if non_interactive:
        if required and not default:
            raise SyncError(f"Missing required argument: {prompt_text}")
        return default or ""

    suffix = f" [{default}]" if default else ""
    entered = input(f"{prompt_text}{suffix}: ").strip()
    if entered:
        return entered
    if default is not None:
        return default
    if required:
        raise SyncError(f"Missing required value: {prompt_text}")
    return ""


def ask_yes_no(
    prompt_text: str,
    default: bool = True,
    non_interactive: bool = False,
) -> bool:
    if non_interactive:
        return default

    suffix = " [Y/n]" if default else " [y/N]"
    entered = input(f"{prompt_text}{suffix}: ").strip().lower()
    if not entered:
        return default
    if entered in {"y", "yes"}:
        return True
    if entered in {"n", "no"}:
        return False
    raise SyncError(f"Invalid answer for '{prompt_text}': '{entered}'")


def load_sync_config(config_path: Path) -> Dict[str, str]:
    if not config_path.exists():
        return {}
    try:
        with config_path.open("r", encoding="utf-8") as fh:
            data = json.load(fh)
        if not isinstance(data, dict):
            raise SyncError(f"Config file must be JSON object: {config_path}")
        return {str(k): str(v) for k, v in data.items() if isinstance(v, (str, int, float, bool))}
    except json.JSONDecodeError as exc:
        raise SyncError(f"Invalid JSON in config file {config_path}: {exc}") from exc


def save_sync_config(config_path: Path, data: Dict[str, str]) -> None:
    config_path.parent.mkdir(parents=True, exist_ok=True)
    existing = load_sync_config(config_path)
    merged = {**existing, **data}
    with config_path.open("w", encoding="utf-8") as fh:
        json.dump(merged, fh, ensure_ascii=True, indent=2)
        fh.write("\n")


def load_manifest(args: argparse.Namespace, github_token: str) -> dict:
    if args.manifest_path:
        manifest_path = Path(args.manifest_path).expanduser().resolve()
        if not manifest_path.exists():
            raise SyncError(f"Manifest file not found: {manifest_path}")
        with manifest_path.open("r", encoding="utf-8") as fh:
            return json.load(fh)

    if args.manifest_url:
        return http_get_json(args.manifest_url, github_token)

    url = (
        "https://raw.githubusercontent.com/"
        f"{args.source_owner}/{args.source_repo}/{args.manifest_ref}/{DEFAULT_MANIFEST_FILE}"
    )
    return http_get_json(url, github_token)


def to_library(raw: dict) -> Library:
    required = ["name", "version", "assetFileName", "downloadUrl", "releaseTag"]
    for field in required:
        if not raw.get(field):
            raise SyncError(f"Manifest entry misses '{field}': {raw}")
    return Library(
        name=str(raw["name"]),
        version=str(raw["version"]),
        asset_file_name=str(raw["assetFileName"]),
        download_url=str(raw["downloadUrl"]),
        release_tag=str(raw["releaseTag"]),
    )


def resolve_libraries_with_fallback(
    libraries: List[Library],
    owner: str,
    repo: str,
    github_token: str,
    anchor_release_tag: str,
) -> Tuple[List[Library], str]:
    releases = fetch_releases(owner, repo, github_token)
    if not releases:
        raise SyncError(f"No releases found in {owner}/{repo}")

    selected_releases, resolved_anchor = select_release_window(releases, anchor_release_tag)
    asset_map = newest_asset_map(selected_releases)

    resolved: List[Library] = []
    for library in libraries:
        release_asset = asset_map.get(library.asset_file_name)
        if release_asset:
            resolved.append(
                Library(
                    name=library.name,
                    version=library.version,
                    asset_file_name=library.asset_file_name,
                    download_url=release_asset.download_url,
                    release_tag=release_asset.release_tag,
                )
            )
            continue
        # Keep manifest value as a fallback if asset not found in selected release window.
        resolved.append(library)
    return resolved, resolved_anchor


def fetch_releases(owner: str, repo: str, github_token: str) -> List[dict]:
    releases: List[dict] = []
    page = 1
    while True:
        url = (
            f"https://api.github.com/repos/{owner}/{repo}/releases"
            f"?per_page=100&page={page}"
        )
        chunk = http_get_json(url, github_token)
        if not isinstance(chunk, list):
            raise SyncError("Unexpected GitHub releases API response")
        if not chunk:
            break
        releases.extend(chunk)
        page += 1
    return releases


def select_release_window(releases: List[dict], anchor_release_tag: str) -> Tuple[List[dict], str]:
    if not anchor_release_tag or anchor_release_tag.lower() == "latest":
        return releases, releases[0].get("tag_name", "latest")

    for idx, release in enumerate(releases):
        if release.get("tag_name") == anchor_release_tag:
            return releases[idx:], anchor_release_tag
    raise SyncError(f"Release tag '{anchor_release_tag}' was not found in GitHub releases")


def newest_asset_map(releases: Iterable[dict]) -> Dict[str, ReleaseAsset]:
    mapping: Dict[str, ReleaseAsset] = {}
    for release in releases:
        tag = str(release.get("tag_name", ""))
        for asset in release.get("assets", []):
            name = str(asset.get("name", ""))
            if not name or name in mapping:
                continue
            url = str(asset.get("browser_download_url", ""))
            if not url:
                continue
            mapping[name] = ReleaseAsset(release_tag=tag, download_url=url)
    return mapping


def update_upload_list(
    upload_list_path: Path,
    libraries: List[Library],
    schema: Dict[str, Any],
    dry_run: bool,
) -> List[Tuple[str, str, str]]:
    by_name = {library.name: library for library in libraries}
    changed: List[Tuple[str, str, str]] = []
    output_lines: List[str] = []

    line_regex = re.compile(r"^(\s*)(\S+)(\s+)(\S+)(.*)$")
    with upload_list_path.open("r", encoding="utf-8") as fh:
        lines = fh.readlines()

    parsed_entries = parse_upload_list_entries(lines)
    validate_json_schema(
        data={"dependencies": parsed_entries},
        schema=schema,
        label="third-party upload list",
    )

    for line in lines:
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            output_lines.append(line)
            continue
        match = line_regex.match(line.rstrip("\n"))
        if not match:
            output_lines.append(line)
            continue

        lead, name, gap, version, tail = match.groups()
        library = by_name.get(name)
        if not library:
            output_lines.append(line)
            continue
        if version != library.version:
            changed.append((name, version, library.version))
        output_lines.append(f"{lead}{name}{gap}{library.version}{tail}\n")

    if changed and not dry_run:
        with upload_list_path.open("w", encoding="utf-8") as fh:
            fh.writelines(output_lines)
    return changed


def download_artifacts(
    artifacts_dir: Path,
    libraries: List[Library],
    github_token: str,
    dry_run: bool,
) -> List[Tuple[str, Path]]:
    downloaded: List[Tuple[str, Path]] = []
    for library in libraries:
        target_file_name = local_artifact_file_name(library.asset_file_name)
        target_path = artifacts_dir / target_file_name
        if dry_run:
            print(f"[DRY-RUN] {library.name}: {library.download_url} -> {target_path}")
            downloaded.append((library.name, target_path))
            continue
        print(f"Downloading {library.name} ({library.version}) from {library.release_tag}")
        print(f"  URL: {library.download_url}")
        print(f"  OUT: {target_path}")
        download_file(library.download_url, target_path, github_token)
        downloaded.append((library.name, target_path))
    return downloaded


def download_file(url: str, target_path: Path, github_token: str) -> None:
    target_path.parent.mkdir(parents=True, exist_ok=True)
    fd, temp_name = tempfile.mkstemp(prefix=target_path.name, suffix=".tmp", dir=str(target_path.parent))
    os.close(fd)
    temp_path = Path(temp_name)
    try:
        try:
            req = request.Request(url, headers=build_headers(github_token))
            with request.urlopen(req, timeout=120) as response, temp_path.open("wb") as out:
                shutil.copyfileobj(response, out)
        except Exception as exc:  # noqa: BLE001
            if not should_use_curl_fallback(exc):
                raise
            curl_download(url=url, target_path=temp_path, github_token=github_token)
        temp_path.replace(target_path)
    except Exception as exc:  # noqa: BLE001
        if temp_path.exists():
            temp_path.unlink()
        raise SyncError(f"Failed to download {url}: {exc}") from exc


def preflight_git(repo_path: Path) -> None:
    status = git(repo_path, ["status", "--porcelain"]).strip()
    if status:
        raise SyncError(
            "Client repository has uncommitted changes. "
            "Commit/stash them before running sync."
        )


def ensure_git_repo(repo_path: Path) -> None:
    if not repo_path.exists():
        raise SyncError(f"Repository path does not exist: {repo_path}")
    try:
        output = git(repo_path, ["rev-parse", "--is-inside-work-tree"]).strip()
    except SyncError as exc:
        raise SyncError(f"Not a git repository: {repo_path}") from exc
    if output != "true":
        raise SyncError(f"Not a git repository: {repo_path}")


def git_commit_and_push(
    repo_path: Path,
    target_branch: str,
    branch_name: str,
    stage_paths: List[str],
    commit_message: str,
    non_interactive: bool,
) -> List[str]:
    if remote_branch_exists(repo_path, target_branch):
        git(repo_path, ["fetch", "origin", target_branch])
        git(repo_path, ["checkout", target_branch])
        git(repo_path, ["pull", "--ff-only", "origin", target_branch])
    else:
        current_branch = git(repo_path, ["rev-parse", "--abbrev-ref", "HEAD"]).strip()
        message = (
            f"Target branch '{target_branch}' does not exist on origin.\n"
            f"Current local branch is '{current_branch}'.\n"
            "Most likely you entered feature branch into 'Target branch for MR'.\n"
            "Use 'develop' or 'main' for target, and feature branch in 'Branch name for commit/MR'."
        )
        if non_interactive:
            raise SyncError(message)
        if not ask_yes_no("Target branch not found. Continue from current branch anyway?", default=False):
            raise SyncError(message)
        print(f"Continuing from current branch: {current_branch}")

    git(repo_path, ["checkout", "-B", branch_name])
    git(repo_path, ["add", *stage_paths])

    changed_files = [
        line[3:]
        for line in git(repo_path, ["status", "--porcelain"]).splitlines()
        if line.strip()
    ]
    if not changed_files:
        return []

    git(repo_path, ["commit", "-m", commit_message])
    git(repo_path, ["push", "-u", "origin", branch_name])
    return changed_files


def remote_branch_exists(repo_path: Path, branch: str) -> bool:
    command = ["git", "-C", str(repo_path), "ls-remote", "--exit-code", "--heads", "origin", branch]
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return result.returncode == 0


def update_mono_yaml(
    yaml_path: Path,
    libraries: List[Library],
    source_owner: str,
    source_repo: str,
    mono_schema: Dict[str, Any],
    dry_run: bool,
) -> List[Tuple[str, str, str, str, str]]:
    by_name = {library.name: library for library in libraries}
    changes: List[Tuple[str, str, str, str, str]] = []
    lines = yaml_path.read_text(encoding="utf-8").splitlines(keepends=True)
    output = list(lines)

    parsed_entries = parse_mono_yaml_entries(lines)
    validate_json_schema(
        data=parsed_entries,
        schema=mono_schema,
        label="mono dependencies yaml",
    )

    block_start_re = re.compile(r"^(\s*)-\s+name:\s*([^\s#]+)\s*$")
    version_re = re.compile(r"^(\s*version:\s*)([^\s#]+)(.*)$")
    url_re = re.compile(
        rf"(https://github\.com/{re.escape(source_owner)}/{re.escape(source_repo)}/releases/tag/)([^\s/]+)",
        flags=re.IGNORECASE,
    )

    i = 0
    while i < len(lines):
        line = lines[i].rstrip("\n")
        match = block_start_re.match(line)
        if not match:
            i += 1
            continue

        name = match.group(2)
        library = by_name.get(name)
        block_end = i + 1
        while block_end < len(lines):
            next_line = lines[block_end].rstrip("\n")
            if block_start_re.match(next_line):
                break
            block_end += 1

        if library:
            old_version = ""
            old_tag = ""
            for j in range(i + 1, block_end):
                version_match = version_re.match(output[j].rstrip("\n"))
                if version_match:
                    old_version = version_match.group(2)
                    if old_version != library.version:
                        output[j] = f"{version_match.group(1)}{library.version}{version_match.group(3)}\n"
                    continue

                url_match = url_re.search(output[j])
                if url_match:
                    old_tag = url_match.group(2)
                    if old_tag != library.release_tag:
                        output[j] = url_re.sub(rf"\1{library.release_tag}", output[j], count=1)

            if (old_version and old_version != library.version) or (
                old_tag and old_tag != library.release_tag
            ):
                changes.append(
                    (
                        name,
                        old_version or library.version,
                        library.version,
                        old_tag or library.release_tag,
                        library.release_tag,
                    )
                )

        i = block_end

    if output != lines and not dry_run:
        yaml_path.write_text("".join(output), encoding="utf-8")
    return changes


def parse_upload_list_entries(lines: List[str]) -> List[Dict[str, str]]:
    entries: List[Dict[str, str]] = []
    line_regex = re.compile(r"^\s*(\S+)\s+(\S+)\s*$")
    for raw_line in lines:
        line = raw_line.strip()
        if not line or line.startswith("#"):
            continue
        match = line_regex.match(line)
        if not match:
            raise SyncError(f"Invalid upload_list line format: '{raw_line.rstrip()}'")
        entries.append({"name": match.group(1), "version": match.group(2)})
    return entries


def parse_mono_yaml_entries(lines: List[str]) -> List[Dict[str, str]]:
    entries: List[Dict[str, str]] = []
    block_start_re = re.compile(r"^\s*-\s+name:\s*([^\s#]+)\s*$")
    version_re = re.compile(r"^\s*version:\s*([^\s#]+)")
    descriptor_re = re.compile(r"^\s*descriptor:\s*\|")

    i = 0
    while i < len(lines):
        line = lines[i].rstrip("\n")
        start = block_start_re.match(line)
        if not start:
            i += 1
            continue

        entry: Dict[str, str] = {"name": start.group(1)}
        i += 1
        descriptor_lines: List[str] = []
        in_descriptor = False
        while i < len(lines):
            current = lines[i].rstrip("\n")
            if block_start_re.match(current):
                break
            version_match = version_re.match(current)
            if version_match:
                entry["version"] = version_match.group(1)
            elif descriptor_re.match(current):
                in_descriptor = True
                descriptor_lines = []
            elif in_descriptor:
                if current.startswith("  ") or current.startswith("\t"):
                    descriptor_lines.append(current.lstrip())
                elif current.strip() == "":
                    descriptor_lines.append("")
                else:
                    in_descriptor = False
            i += 1

        if descriptor_lines:
            entry["descriptor"] = "\n".join(descriptor_lines).rstrip()
        entries.append(entry)
    return entries


def validate_json_schema(data: Any, schema: Dict[str, Any], label: str) -> None:
    errors: List[str] = []
    validate_schema_node(data=data, schema=schema, path="$", errors=errors)
    if errors:
        raise SyncError(f"{label} validation failed: {errors[0]}")


def load_schema_definition(
    local_path: Optional[str],
    fallback_repo_path: str,
    args: argparse.Namespace,
    github_token: str,
    label: str,
) -> Dict[str, Any]:
    if local_path:
        schema_path = Path(local_path).expanduser().resolve()
        if not schema_path.exists():
            raise SyncError(f"{label} file not found: {schema_path}")
        try:
            with schema_path.open("r", encoding="utf-8") as fh:
                data = json.load(fh)
        except json.JSONDecodeError as exc:
            raise SyncError(f"Invalid JSON in {label} ({schema_path}): {exc}") from exc
        if not isinstance(data, dict):
            raise SyncError(f"{label} must be a JSON object: {schema_path}")
        return data

    url = (
        "https://raw.githubusercontent.com/"
        f"{args.source_owner}/{args.source_repo}/{args.manifest_ref}/{fallback_repo_path}"
    )
    data = http_get_json(url, github_token)
    if not isinstance(data, dict):
        raise SyncError(f"Downloaded {label} is not a JSON object: {url}")
    return data


def normalize_optional_path(path_value: Optional[str]) -> str:
    if not path_value:
        return ""
    return str(Path(path_value).expanduser().resolve())


def validate_schema_node(data: Any, schema: Dict[str, Any], path: str, errors: List[str]) -> None:
    schema_type = schema.get("type")
    if schema_type == "object":
        if not isinstance(data, dict):
            errors.append(f"{path} must be object")
            return
        required = schema.get("required", [])
        for key in required:
            if key not in data:
                errors.append(f"{path}.{key} is required")
                return
        properties = schema.get("properties", {})
        additional = schema.get("additionalProperties", True)
        for key, value in data.items():
            if key in properties:
                validate_schema_node(value, properties[key], f"{path}.{key}", errors)
                if errors:
                    return
            elif additional is False:
                errors.append(f"{path}.{key} is not allowed")
                return
        return

    if schema_type == "array":
        if not isinstance(data, list):
            errors.append(f"{path} must be array")
            return
        min_items = schema.get("minItems")
        if isinstance(min_items, int) and len(data) < min_items:
            errors.append(f"{path} must contain at least {min_items} items")
            return
        item_schema = schema.get("items")
        if isinstance(item_schema, dict):
            for idx, item in enumerate(data):
                validate_schema_node(item, item_schema, f"{path}[{idx}]", errors)
                if errors:
                    return
        return

    if schema_type == "string":
        if not isinstance(data, str):
            errors.append(f"{path} must be string")
            return
        min_length = schema.get("minLength")
        if isinstance(min_length, int) and len(data) < min_length:
            errors.append(f"{path} length must be >= {min_length}")
            return
        pattern = schema.get("pattern")
        if isinstance(pattern, str) and not re.match(pattern, data):
            errors.append(f"{path} does not match pattern")
            return
        return


def create_gitlab_mr(
    gitlab_url: str,
    project_id: str,
    private_token: str,
    source_branch: str,
    target_branch: str,
    title: str,
    description: str,
) -> str:
    encoded_project = parse.quote(project_id, safe="")
    endpoint = f"{gitlab_url.rstrip('/')}/api/v4/projects/{encoded_project}/merge_requests"
    payload = parse.urlencode(
        {
            "source_branch": source_branch,
            "target_branch": target_branch,
            "title": title,
            "description": description,
            "remove_source_branch": "false",
        }
    ).encode("utf-8")

    headers = {
        "PRIVATE-TOKEN": private_token,
        "Content-Type": "application/x-www-form-urlencoded",
    }
    req = request.Request(endpoint, data=payload, method="POST", headers=headers)
    try:
        with request.urlopen(req, timeout=60) as resp:
            result = json.loads(resp.read().decode("utf-8"))
            return str(result.get("web_url", ""))
    except error.HTTPError as exc:
        body = exc.read().decode("utf-8", errors="replace")
        raise SyncError(f"GitLab MR creation failed: HTTP {exc.code} {body}") from exc
    except Exception as exc:  # noqa: BLE001
        raise SyncError(f"GitLab MR creation failed: {exc}") from exc


def relpath(path: Path, root: Path) -> str:
    try:
        return str(path.relative_to(root))
    except ValueError as exc:
        raise SyncError(f"Path '{path}' must be inside repository '{root}'") from exc


def git(repo_path: Path, args: List[str]) -> str:
    command = ["git", "-C", str(repo_path), *args]
    try:
        return subprocess.check_output(command, stderr=subprocess.STDOUT, text=True)
    except subprocess.CalledProcessError as exc:
        raise SyncError(f"Git command failed: {' '.join(command)}\n{exc.output}") from exc


def build_headers(token: str) -> Dict[str, str]:
    headers = {
        "Accept": "application/vnd.github+json",
        "User-Agent": "plasma-release-sync/1.0",
    }
    if token:
        headers["Authorization"] = f"Bearer {token}"
    return headers


def http_get_json(url: str, github_token: str) -> dict:
    body: str
    req = request.Request(url, headers=build_headers(github_token))
    try:
        with request.urlopen(req, timeout=60) as response:
            body = response.read().decode("utf-8")
    except error.HTTPError as exc:
        err_body = exc.read().decode("utf-8", errors="replace")
        raise SyncError(f"HTTP {exc.code} for {url}: {err_body}") from exc
    except Exception as exc:  # noqa: BLE001
        if not should_use_curl_fallback(exc):
            raise SyncError(f"Request failed for {url}: {exc}") from exc
        try:
            body = curl_get_text(url=url, github_token=github_token)
        except SyncError:
            raise
        except Exception as curl_exc:  # noqa: BLE001
            raise SyncError(f"Request failed for {url}: {curl_exc}") from curl_exc

    try:
        return json.loads(body)
    except json.JSONDecodeError as exc:
        raise SyncError(f"Failed to parse JSON from {url}: {exc}") from exc


def should_use_curl_fallback(exc: Exception) -> bool:
    text = str(exc).lower()
    return "unknown url type: https" in text or "ssl" in text


def curl_get_text(url: str, github_token: str) -> str:
    command = ["curl", "-fsSL", "--connect-timeout", "20", "--max-time", "120"]
    for key, value in build_headers(github_token).items():
        command.extend(["-H", f"{key}: {value}"])
    command.append(url)
    try:
        return subprocess.check_output(command, stderr=subprocess.STDOUT, text=True)
    except subprocess.CalledProcessError as exc:
        raise SyncError(f"curl request failed for {url}: {exc.output}") from exc


def curl_download(url: str, target_path: Path, github_token: str) -> None:
    command = ["curl", "-fsSL", "--connect-timeout", "20", "--max-time", "300", "-o", str(target_path)]
    for key, value in build_headers(github_token).items():
        command.extend(["-H", f"{key}: {value}"])
    command.append(url)
    try:
        subprocess.check_output(command, stderr=subprocess.STDOUT, text=True)
    except subprocess.CalledProcessError as exc:
        raise SyncError(f"curl download failed for {url}: {exc.output}") from exc


def render_template(template: str, context: Dict[str, str]) -> str:
    safe_context = dict(context)
    safe_context.setdefault("release_tag", context.get("release_tag", "latest"))
    safe_context.setdefault("timestamp", str(int(time.time())))
    try:
        return template.format(**safe_context)
    except KeyError as exc:
        raise SyncError(f"Unknown template variable in '{template}': {exc}") from exc


def build_template_context(input_release_tag: str, resolved_anchor_tag: str) -> Dict[str, str]:
    now = datetime.now(timezone.utc)
    return {
        "release_tag": resolved_anchor_tag if input_release_tag == "latest" else input_release_tag,
        "resolved_release_tag": resolved_anchor_tag,
        "date": now.strftime("%Y-%m-%d"),
        "timestamp": str(int(now.timestamp())),
        "datetime": now.isoformat(),
    }


def print_summary(
    changed_versions: List[Tuple[str, str, str]],
    downloaded: List[Tuple[str, Path]],
    dry_run: bool,
) -> None:
    mode = "DRY-RUN" if dry_run else "APPLIED"
    print(f"\nSummary ({mode})")
    print("----------------")
    if changed_versions:
        print("Version changes:")
        for name, old, new in changed_versions:
            print(f"  - {name}: {old} -> {new}")
    else:
        print("Version changes: none")

    if downloaded:
        print("Artifacts:")
        for name, path in downloaded:
            print(f"  - {name}: {path}")
    else:
        print("Artifacts: none")


def print_mono_summary(
    yaml_changes: List[Tuple[str, str, str, str, str]],
    dry_run: bool,
) -> None:
    mode = "DRY-RUN" if dry_run else "APPLIED"
    print(f"\nSummary ({mode})")
    print("----------------")
    if not yaml_changes:
        print("YAML changes: none")
        return
    print("YAML changes:")
    for name, old_version, new_version, old_tag, new_tag in yaml_changes:
        print(
            f"  - {name}: version {old_version} -> {new_version}; "
            f"release tag {old_tag} -> {new_tag}"
        )


def local_artifact_file_name(asset_file_name: str) -> str:
    return re.sub(r"(?i)\.xcframework(?=\.zip$)", "", asset_file_name)


def print_resolution_log(libraries: List[Library]) -> None:
    print("\nResolved libraries and sources")
    print("------------------------------")
    for library in libraries:
        print(f"- {library.name} {library.version}")
        print(f"  release: {library.release_tag}")
        print(f"  asset:   {library.asset_file_name}")
        print(f"  url:     {library.download_url}")


if __name__ == "__main__":
    raise SystemExit(main())
