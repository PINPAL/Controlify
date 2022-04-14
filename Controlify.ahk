#Include VA.ahk
#Include ControlifyVA_Calls.ahk

Menu, Tray, Icon, Controlify.ico
#MaxHotkeysPerInterval 99999999999999
#SingleInstance, force
SetBatchLines, 5ms

; GUI Style
Gui, Color, % 282828,
Gui, -Caption +AlwaysOnTop +ToolWindow +E0x20 +SysMenu
Gui, Add, Progress, C1db954 background404040 w10 h300 x15 y20 Vertical vVolumeBarGUI
Gui, Add, Pic, x9 y335 w24 h24, Spotify.png

*Volume_Up::
VA_SetAppVolume("Spotify.exe", VA_GetAppVolume("Spotify.exe") + 1)
Gosub, UpdateBar
return

*Volume_Down::
VA_SetAppVolume("Spotify.exe", VA_GetAppVolume("Spotify.exe") - 1)
Gosub, UpdateBar
return

; Call to Update GUI
UpdateBar:
CurrentVolume := VA_GetAppVolume("Spotify.exe")
GuiControl,,VolumeBarGUI, %CurrentVolume%
Gui, Show, NoActivate h380 w40 x1940 y350, ControlifyGUI
WinSet, Region, w40 h380 R40-30 0-0, ControlifyGUI
SetTimer, HideBar, 1500
return

; Call to Hide GUI
HideBar:
Gui, Hide
return