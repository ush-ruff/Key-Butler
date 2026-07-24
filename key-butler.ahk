; Custom shortcuts for windows
; Script v0.4.0

#Requires AutoHotkey v2.0
#SingleInstance Force
SetWorkingDir A_ScriptDir
SendMode "Input"
SetCapsLockState "AlwaysOff"

; ------------------------------------------------------------
; Tray configuration
; ------------------------------------------------------------
A_TrayMenu.Delete()                                 ; Remove all standard menu items
A_TrayMenu.Add("Open", (*) => Edit())
A_TrayMenu.Add("Toggle CapsLock", (*) => ToggleCapsLockState())
A_TrayMenu.Add()
A_TrayMenu.Add("Reload Script", (*) => Reload())
A_TrayMenu.Add("Pause Script", (*) => Pause())
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Open"

A_IconTip := "Custom shortcuts for Windows - CapsLock DISABLED"

iconPath := A_ScriptDir "\icon\shortcut-icon.ico"
if FileExist(iconPath)
  TraySetIcon iconPath

; ------------------------------------------------------------
; Other configuration
; ------------------------------------------------------------
capsLockDisabled := true

; Toggle CapsLock
; Key: Ctrl + Win + X
^#x::ToggleCapsLockState()

; ------------------------------------------------------------
; Shortcuts
; ------------------------------------------------------------
; Minimize active window
; Key: Ctrl + Win + DownArrow
^#Down:: WinMinimize("A")

; Close active window
; Key: Win + W
#W:: WinClose("A")

; Open right click menu by triggering AppsKey
; Key: RightCtrl + ?
>^/:: Send "{AppsKey}" ; try "{Shift + F10}" if AppsKey doesn't work

; Toggle Play/Pause in WMP
; Key: Ctrl + Shift + Space
^+Space:: PauseWMP()

; Key: Ctrl + Media_Play_Pause
^Media_Play_Pause:: PauseWMP()

; SteelSeries Sonar media key redirect
Volume_Up:: Send (SonarRunning() ? "{F13}" : "{Volume_Up}")
Volume_Down:: Send (SonarRunning() ? "{F14}" : "{Volume_Down}")
Volume_Mute:: Send (SonarRunning() ? "{F15}" : "{Volume_Mute}")

; Test hotkey:
; ^Media_Play_Pause:: MsgBox A_ThisHotkey

#HotIf capsLockDisabled
  ; Remap keys using CapsLock as a modifier
  CapsLock & i::SendBlindKeys("{Up}")
  CapsLock & j::SendBlindKeys("{Left}")
  CapsLock & l::SendBlindKeys("{Right}")
  CapsLock & k::SendBlindKeys("{Down}")

  CapsLock & u::SendBlindKeys("{Home}")
  CapsLock & o::SendBlindKeys("{End}")
  CapsLock & y::SendBlindKeys("{PgUp}")
  CapsLock & p::SendBlindKeys("{PgDn}")

  CapsLock & h::SendBlindKeys("{Delete}")
  CapsLock & `;::SendBlindKeys("{Backspace}")

  ; Modifier keys
  ; Modifier keys with CapsLock
  CapsLock & f::Send "{Ctrl down}" ; Press and hold Ctrl
  CapsLock & f up::Send "{Ctrl up}" ; Release Ctrl

  CapsLock & d::Send "{Shift down}" ; Press and hold Shift
  CapsLock & d up::Send "{Shift up}" ; Release Shift

  CapsLock & s::Send "{Alt down}" ; Press and hold Alt
  CapsLock & s up::Send "{Alt up}" ; Release Alt

  CapsLock & w::Send "{LWin down}" ; Press and hold Windows
  CapsLock & w up::Send "{LWin up}" ; Release Windows

#HotIf

; ------------------------------------------------------------
; Helper Functions
; ------------------------------------------------------------
PauseWMP(*) {
  if WinExist("ahk_exe wmplayer.exe") {
    ; 0x319 is the WM_APPCOMMAND message, 0xE0000 is APPCOMMAND_MEDIA_PLAY_PAUSE
    SendMessage 0x319, 0, 0xE0000, , "ahk_exe wmplayer.exe"
  }
}

SonarRunning(*) {
  return ProcessExist("SteelSeriesSonar.exe")
    || ProcessExist("SteelSeriesSonarService.exe")
    || ProcessExist("SteelSeriesEngine.exe")
    || ProcessExist("SteelSeriesGG.exe")
    || ProcessExist("SteelSeriesGGClient.exe")
}

ToggleCapsLockState() {
  global capsLockDisabled
  capsLockDisabled := !capsLockDisabled
  capsLockState := capsLockDisabled ? "AlwaysOff" : ""
  capsLockStatus := capsLockDisabled ? "DISABLED" : "ENABLED"
  SetCapsLockState capsLockState
  A_IconTip := "Custom shortcuts for Windows - CapsLock " capsLockStatus
  TrayTip "Key Butler", "CapsLock " capsLockStatus, 1
}

SendBlindKeys(keys) {
  Send "{Blind}" keys
}
