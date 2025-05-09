#Requires AutoHotkey 2.0+
#SingleInstance Force
#Include utils.ahk
; #NoTrayIcon

#SuspendExempt
CapsLock & 6:: Toggle
Esc:: ExitApp()
#SuspendExempt False
Toggle() {
    ; Sleep 1000
    Suspend
    gg.Move(x, y + A_IsSuspended * 1000, 10, 10)
    ; gg.Move
}

; https://stackoverflow.com/questions/35971452/what-is-the-right-way-to-send-alt-tab-in-ahk
; If you just want to switch back to the previous application, use Send, !{Esc}
; Send "!{Esc}"
; Send "!{Tab}"
; SendInput "{AltTab}"

; scrW := A_ScreenWidth
; scrH := A_ScreenHeight
gg := Gui("-DPIScale +AlwaysOnTop +ToolWindow -Caption")
gg.BackColor := "ff00ff"
; gg.BackColor := "Red"

gg.Show("x9999y0")
; gg.Show("x" 0-275 "y" 1060 "w10h10")
x := 275
y := 974
gg.Show("x" x "y" y "w10h10")


j::Left
i::Up ; more familiar shape (mirrored WASD)
k::Up
l::Right
sc027::Down ;;
; Space::p