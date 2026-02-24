# Blue Light Filter

A Magisk/KernelSU module that applies a system-wide blue light filter directly through SurfaceFlinger, Android's graphics compositor.

## Why reduce blue light?
Screens emit a high amount of blue light, which can cause eye strain, headaches, and difficulty sleeping, especially at night. Reducing blue light in the evening helps your eyes feel more comfortable and makes it easier to wind down before bed.

## Features
- Covers the entire screen, including status bar and navigation bar.
- No overlay window. Works even on apps that block screen overlays.
- Configurable RGB color via a built-in WebUI.
- Auto-start on boot (optional).
- No background process. Zero battery impact.
- Works with Magisk and KernelSU.

## What is this project?
Most blue light filter apps draw a colored overlay on top of the screen, which has limitations, it doesn't cover the status bar, navigation bar, or apps with `FLAG_SECURE`. This module applies the filter at the compositor level using a SurfaceFlinger color transform matrix, so it covers everything with no exceptions.

## Prerequisites
- Android 8.0+ (API 26 or higher)
- Magisk or KernelSU installed
- MMRL or KSUWebUIStandalone installed (to access the WebUI)

## Installation
1. Download the latest release.
2. Flash it in Magisk or KernelSU.
3. Reboot your device.
4. Open the WebUI via MMRL or KSUWebUIStandalone.
5. Adjust the color sliders and tap **Apply & Save**.

## Usage
- **Blue Light Filter toggle** — enables or disables the filter.
- **Custom Color** — set your own RGB values (Red minimum is 0.10 to avoid a black screen).
- **Auto-start on boot** — re-applies the filter automatically after every reboot.
- **Remove filter now** — clears the filter from the screen without changing your saved settings.

## Known Issues
- May not work on ROMs that restrict SurfaceFlinger binder access, such as some MIUI and One UI builds. Run `bluefilter diag` in a root shell to check.

## License
This project is licensed under the GNU General Public License v3.0 (GPL-3.0).
You are free to modify and redistribute it under the same terms.

See the full [LICENSE](LICENSE) file for details.
