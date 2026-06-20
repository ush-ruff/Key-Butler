; Custom shortcuts for windows
; Script v0.3.0

#Requires AutoHotkey v2.0
#SingleInstance Force

; ----------------------------------------
; Tray configuration
; ----------------------------------------
iconPath := A_ScriptDir "\icon\shortcut-icon.ico"
if FileExist(iconPath)
  TraySetIcon iconPath

A_IconTip := "Custom shortcuts for Windows"
A_TrayMenu.Delete()                                 ; Remove all standard menu items
A_TrayMenu.Add("Open", (*) => Edit())
A_TrayMenu.Add("Reload Script", (*) => Reload())
A_TrayMenu.Add("Pause Script", (*) => Pause())
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Open"

; ----------------------------------------
; Shortcuts
; ----------------------------------------
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

; ----------------------------------------
; Helper Functions
; ----------------------------------------
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
