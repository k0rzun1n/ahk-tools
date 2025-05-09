#Requires AutoHotkey 2.0+
#SingleInstance Force
#Include utils.ahk
; #NoTrayIcon

#SuspendExempt
CapsLock & 5:: Toggle
Esc:: ExitApp()
#SuspendExempt False
Toggle() {
    ; Sleep 1000
    Suspend
    gg.Move(x, y + A_IsSuspended * 1000)
    ; gg.Move(x, y + A_IsSuspended * 1000, 10, 10)
    ; gg.Move
} 

gg := Gui("-DPIScale +AlwaysOnTop +ToolWindow -Caption")
gg.BackColor := "ffff00"
; gg.BackColor := "Red"

; gg.Show("x9999y0")
; gg.Show("x" 0-275 "y" 1060 "w10h10")
x := 295
y := 974
gg.Show("x" x "y" y "w10h100")
; y := 1074
; gg.Show("x" x "y" y "w10h10")


1::F1
2::F2
3::F3
4::F4
5::F5
6::F6
7::F7
8::F8
9::F9
0::F10
-::F11
=::F12

