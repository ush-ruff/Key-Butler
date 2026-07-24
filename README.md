# Key-Butler

![Version](https://img.shields.io/badge/version-0.4.0-blue)
[![Download](https://img.shields.io/badge/download-latest-green)](https://github.com/ush-ruff/Key-Butler/releases/latest)

> AutoHotkey v2 script that transforms your CapsLock key into a powerful navigation modifier and optimizes system shortcuts for a more efficient workflow.

## Quick Start

- **Standalone** — Download the latest release from the [Releases page](https://github.com/ush-ruff/Key-Butler/releases) (no dependencies required).
- **Source** — Double-click `key-butler.ahk` (requires [AutoHotkey v2](https://www.autohotkey.com/)).

## Features

### System Shortcuts
- **Minimize Active Window:** `Ctrl + Win + DownArrow`
- **Close Active Window:** `Win + W`
- **Open Right-Click Menu:** `RightCtrl + /` (triggers AppsKey)
- **Toggle WMP Play/Pause:** `Ctrl + Shift + Space` or `Ctrl + Media_Play_Pause`

### Smart Media Keys
Intelligent redirection for **SteelSeries Sonar** users:
- Volume Up/Down/Mute keys are automatically redirected to F13, F14, and F15 when Sonar is running, preventing standard system volume changes from interfering with your mixer.

### Keybindings
Use **CapsLock** as a modifier to access the following keys and system modifiers:

|Key           |Action   |
|--------------|---------|
|`CapsLock + i`|Up       |
|`CapsLock + l`|Right    |
|`CapsLock + k`|Down     |
|`CapsLock + j`|Left     |
|`CapsLock + u`|Home     |
|`CapsLock + o`|End      |
|`CapsLock + y`|PageUp   |
|`CapsLock + p`|PageDown |
|`CapsLock + h`|Delete   |
|`CapsLock + ;`|Backspace|
|`CapsLock + f`|Ctrl     |
|`CapsLock + d`|Shift    |
|`CapsLock + s`|Alt      |
|`CapsLock + w`|Win Key  |

## System Tray
Right-click the tray icon to access:

| Menu Item       | Action                          |
|-----------------|---------------------------------|
| Open            | Edit the script                 |
| Toggle CapsLock | Enable / disable CapsLock state |
| Reload Script   | Reload the AHK script           |
| Pause Script    | Suspend all hotkeys             |
| Exit            | Quit the script                 |

## Advanced Configuration

> Pre-built binaries are available on the [Releases page](https://github.com/ush-ruff/Key-Butler/releases). Compiling is only needed if you want to modify the source.

<details>
<summary>Compiling (Installed Method)</summary>

You can compile the script into a standalone `.exe` using AutoHotkey’s compiler if it is already installed on your system.

### Steps:

1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Locate `Ahk2Exe.exe` (included with AHK).
3. Run the compilation via command line, or right-click the script and choose **“Compile Script”** or **"Compile Script (GUI)"** if the option is available.
</details>

<details>
<summary>Compiling (Portable Method)</summary>

Generate `key-butler.exe` yourself without installing AutoHotkey:

1. **Download portable AutoHotkey v2** — [ahk-v2.zip](https://www.autohotkey.com/download/ahk-v2.zip)
   - Extract to a folder (e.g., `C:\tools\AutoHotkey-v2`)
2. **Download Ahk2Exe** — latest release from [AutoHotkey/Ahk2Exe](https://github.com/AutoHotkey/Ahk2Exe/releases)
   - Extract `Ahk2Exe.exe` into the same folder
3. **Compile** — use the base file matching your system (32-bit or 64-bit):
   ```powershell
   "C:\tools\AutoHotkey-v2\AutoHotkey64.exe" ^
     "C:\tools\AutoHotkey-v2\Ahk2Exe.exe" /in key-butler.ahk /out key-butler.exe
   ```
The resulting `.exe` is fully standalone — no runtime needed.
</details>

<details>
<summary>Running on Startup</summary>

To launch the script automatically on Windows startup:

1. Press **Win + R** and type
   ```powershell
   shell:startup
   ```
2. Press Enter and place either:
   - `key-butler.ahk`, or
   - the compiled `.exe` (recommended) — [download from releases](https://github.com/ush-ruff/Key-Butler/releases/latest)
   
   > A shortcut to either of those files will also work.
</details>

## License

[GNU GPLv3](./LICENSE).
