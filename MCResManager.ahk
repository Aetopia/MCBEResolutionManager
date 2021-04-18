#Persistent
#SingleInstance,Force
VarSetCapacity(dM,156,0), NumPut(156,2,&dM,36)
DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&dM )
GRR = % "" . NumGet(&dM, 120)
IniWrite, %A_ScreenWidth%, options.ini, Screen_Resolution, Width
IniWrite, %A_ScreenHeight%, options.ini, Screen_Resolution, Height
IniWrite, %GRR%, options.ini, Screen_Resolution, Refresh_Rate
IniWrite, 32, options.ini, Screen_Resolution, Color_Depth
Menu, Tray, NoStandard
Menu, Tray, Tip, MCBE Resolution Manager v1.0
Menu, Submenu, add, 720p, 720p
Menu, Submenu, add, 900p, 900p
Menu, Submenu, add, 1080p, 1080p
Menu, Submenu, add, Custom, CuRes
Menu, Tray, add, Resolution, :Submenu
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
If (MC_W = 1280 and MC_H = 720){
Menu, Submenu, ToggleCheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1600 and MC_H = 900){
Menu, Submenu, ToggleCheck, 900p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1920 and MC_H = 1080){
Menu, Submenu, ToggleCheck, 1080p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, Custom
}
else {
Menu, Submenu, ToggleCheck, Custom
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, 900p
}
Menu, Tray, Add
Menu, Tray, Add, Exit, Exit
GuiError = 0
SetTimer, MCActive, On
SetTimer, MCNotActive, Off
return
ChangeResolution( cD, sW, sH, rR ) {
VarSetCapacity(dM,156,0), NumPut(156,2,&dM,36)
DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&dM ),
NumPut(0x5c0000,dM,40) NumPut(cD,dM,104), NumPut(sW,dM,108), NumPut(sH,dM,112), NumPut(rR,dM,120)
Return DllCall( "ChangeDisplaySettingsA", UInt,&dM, UInt,0 )
}
MCActive:
IfWinActive, Minecraft ahk_exe ApplicationFrameHost.exe
{
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
IniRead, R, options.ini, Screen_Resolution, Refresh_Rate, Default
IniRead, CD, options.ini, Screen_Resolution, Color_Depth, Default
IniRead, D, options.ini, Debug, Enable_Debugging, Default
If (D = 1)
{
MsgBox,, MCBE Resolution, %CD%, %MC_W%, %MC_H%, %R%, %M%
}
ChangeResolution(CD, MC_W, MC_H, R)
SetTimer, MCNotActive, On
SetTimer, MCActive, Off
}
return
MCNotActive:
IfWinNotActive, Minecraft ahk_exe ApplicationFrameHost.exe
{
IniRead, W, options.ini, Screen_Resolution, Width, Default
IniRead, H, options.ini, Screen_Resolution, Height, Default
IniRead, CD, options.ini, Screen_Resolution, Color_Depth, Default
IniRead, R, options.ini, Screen_Resolution, Refresh_Rate, Default
IniRead, D, options.ini, Debug, Enable_Debugging, Default
If (D = 1)
{
MsgBox,, MCBE Resolution, %CD%, %MC_W%, %MC_H%, %R%, %M%
}
ChangeResolution(CD, W, H, R)
SetTimer, MCNotActive, Off
SetTimer, MCActive, On
}
return
720p:
IniWrite, 1280, options.ini, MC_Resolution, MC_Width
IniWrite, 720, options.ini, MC_Resolution, MC_Height
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
If (MC_W = 1280 and MC_H = 720){
Menu, Submenu, ToggleCheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1600 and MC_H = 900){
Menu, Submenu, ToggleCheck, 900p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1920 and MC_H = 1080){
Menu, Submenu, ToggleCheck, 1080p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, Custom
}
else {
Menu, Submenu, ToggleCheck, Custom
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, 900p
}
return
900p:
IniWrite, 1600, options.ini, MC_Resolution, MC_Width
IniWrite, 900, options.ini, MC_Resolution, MC_Height
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
If (MC_W = 1280 and MC_H = 720){
Menu, Submenu, ToggleCheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1600 and MC_H = 900){
Menu, Submenu, ToggleCheck, 900p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1920 and MC_H = 1080){
Menu, Submenu, ToggleCheck, 1080p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, Custom
}
else {
Menu, Submenu, ToggleCheck, Custom
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, 900p
}
return
1080p:
IniWrite, 1920, options.ini, MC_Resolution, MC_Width
IniWrite, 1080, options.ini, MC_Resolution, MC_Height
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
If (MC_W = 1280 and MC_H = 720){
Menu, Submenu, ToggleCheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1600 and MC_H = 900){
Menu, Submenu, ToggleCheck, 900p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1920 and MC_H = 1080){
Menu, Submenu, ToggleCheck, 1080p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, Custom
}
else {
Menu, Submenu, ToggleCheck, Custom
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, 900p
}
return
CuRes:
If (GuiError = 0){
GuiError = 1
Gui -SysMenu
Gui, Color, C0C0C0
Gui, Font, s10
Gui, Add, Edit, w40 vC_W
Gui, Add, Text, x60 y10,x
Gui, Add, Edit, w40 y7 x75 vC_H
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
Gui, Add, Text, x12, Current: %MC_W% x %MC_H%
Gui, Add, Button, x105 y70 gSave, Save
Gui, Show, w150 h100, Enter Custom Resolution:
return
}
else {
return
}
Save:
GuiError = 0
Gui, Submit
IniWrite, %C_W%, options.ini, MC_Resolution, MC_Width
IniWrite, %C_H%, options.ini, MC_Resolution, MC_Height
Gui, Destroy
IniRead, MC_W, options.ini, MC_Resolution, MC_Width, Default
IniRead, MC_H, options.ini, MC_Resolution, MC_Height, Default
If (MC_W = 1280 and MC_H = 720){
Menu, Submenu, ToggleCheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1600 and MC_H = 900){
Menu, Submenu, ToggleCheck, 900p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, Custom
}
else if (MC_W = 1920 and MC_H = 1080){
Menu, Submenu, ToggleCheck, 1080p
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 900p
Menu, Submenu, Uncheck, Custom
}
else {
Menu, Submenu, Check, Custom
Menu, Submenu, Uncheck, 720p
Menu, Submenu, Uncheck, 1080p
Menu, Submenu, Uncheck, 900p
}
return

Exit:
ExitApp
