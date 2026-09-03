# Third-party licenses

This project bundles or links the third-party software listed below. Each entry keeps the
license under which the original work is distributed.

## Shipped in the runtime libraries

### InputMask

- Source: <https://github.com/RedMadRobot/input-mask-ios>
- Version: see `Vendor/InputMask` (git submodule)
- License: MIT
- Copyright (c) 2023 YEHOR TAFLANIDI

Linked into `SDDSComponents` and published as `InputMask.xcframework` with every release.
Inside `SDDSComponents` it is imported as `@_implementationOnly`, so it is not part of the
public API surface.

## Linked into the `dsbuilder` CLI

The design-system CLI (`DesignSystemBuilder`, published as `dsbuilder-cli-<tag>.zip`) links the
following packages. Exact pinned revisions are in
[`DesignSystemBuilder/Package.resolved`](DesignSystemBuilder/Package.resolved).

| Package | Source | License |
|---|---|---|
| swift-argument-parser | <https://github.com/apple/swift-argument-parser> | Apache-2.0 |
| swift-syntax | <https://github.com/swiftlang/swift-syntax> | Apache-2.0 with Runtime Library Exception |
| Stencil | <https://github.com/stencilproject/Stencil> | MIT — Copyright (c) 2022, Kyle Fuller |
| PathKit | <https://github.com/kylef/PathKit> | MIT — Copyright (c) 2014, Kyle Fuller |
| Spectre | <https://github.com/kylef/Spectre> | MIT — Copyright (c) 2015, Kyle Fuller |

`swift-syntax` is additionally used by the `SDDSApiInfo` macro plugin and by
`Tools/SDDSApiInfoGenerator`. Both are build-time only and are not shipped in any artifact.

## Test-only dependencies

| Package | Source | License |
|---|---|---|
| OHHTTPStubs | <https://github.com/AliSoftware/OHHTTPStubs> | MIT — Copyright (c) 2012 Olivier Halligon |

## License texts

### MIT License

Applies to InputMask, Stencil, PathKit, Spectre and OHHTTPStubs, each with its own copyright
line as listed above.

```
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

### Apache License 2.0

Applies to `swift-argument-parser` and `swift-syntax`. Full text:
<https://www.apache.org/licenses/LICENSE-2.0>

`swift-syntax` additionally carries the Swift Runtime Library Exception; its text ships with the
package as `LICENSE.txt` and is reproduced in the release archive alongside the CLI binary.

## The project itself

`plasma-ios` is distributed under the MIT License — see [LICENSE](LICENSE).
