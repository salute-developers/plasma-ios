#!/bin/bash

set -e  # Exit on error

# Определяем корневую директорию проекта
# Если скрипт запускается из Xcode, используем SRCROOT
# Иначе используем директорию на 2 уровня выше от скрипта
if [ -n "$SRCROOT" ]; then
    PROJECT_ROOT="$SRCROOT/.."
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
fi

echo "📦 Корневая директория проекта: $PROJECT_ROOT"

# Шаг 1: Сборка SDDSThemeCore
echo "📦 Шаг 1: Сборка SDDSThemeCore..."
cd "$PROJECT_ROOT/DesignSystemBuilder"
ruby "$PROJECT_ROOT/scripts/build_xcframeworks.rb" -d . -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore

# Шаг 2: Сборка SDDSComponents и SDDSIcons
echo "📦 Шаг 2: Сборка SDDSComponents и SDDSIcons..."
cd "$PROJECT_ROOT"
ruby "$PROJECT_ROOT/scripts/build_xcframeworks.rb" -w SDDS.xcworkspace

# Шаг 3: Сборка InputMask
echo "📦 Шаг 3: Сборка InputMask..."
cd "$PROJECT_ROOT"
ruby "$PROJECT_ROOT/scripts/build_inputmask.rb"

# Шаг 4: Сборка всех тем
echo "📦 Шаг 4: Сборка всех тем..."
cd "$PROJECT_ROOT"
ruby "$PROJECT_ROOT/scripts/build_themes.rb" --no-zip

echo "✅ Все зависимости успешно собраны!"

