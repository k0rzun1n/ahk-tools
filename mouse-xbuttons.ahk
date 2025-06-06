#Requires AutoHotkey 2.0+
#SingleInstance Force
#Include utils.ahk
; Esc::ExitApp()
; x1 near; x2 far

XButton2 & RButton::AltTab
XButton2 & LButton::ShiftAltTab
XButton1 & RButton::^Tab
XButton1 & LButton::^+Tab

XButton2 & WheelUp::^WheelUp
XButton2 & WheelDown::^WheelDown

RButton & XButton2::Enter
RButton & XButton1::Space

XButton1 & XButton2::!F4
XButton2 & XButton1:: Send("^+{Esc}")

;prevent context menu on &RB
#HotIf !(GKSP("XButton2") || GKSP("LButton") || GKSP("MButton"))
RButton::RButton
;LB&
#HotIf GKSP("LButton")
XButton2::^w
XButton1::^z
MButton::Esc ;cancel drag
RButton::^v
#HotIf
RButton & LButton::^c

;Youtube Speed Controls extension
MButton & XButton1:: Send "!~" ;x5
XButton1 & MButton:: Send "~" ;x2/x1
; MButton & WheelUp::   Send "~"
; MButton & WheelDown:: Send "!~"
MButton & WheelDown:: Send "{Down}"
MButton & WheelUp:: Send "{Up}"

MButton & XButton2:: ToolTipTimed("MB & XB2", 1000)
XButton2 & MButton:: ToolTipTimed("XB2 & MB", 1000)

RButton & WheelUp:: SoundGetVolume() < 42 ? Send("{Volume_Up}") : 0
RButton & WheelDown:: Send("{Volume_Down}")

; XButton1 & WheelUp::   ToolTipTimed("XB1 & WUp", 1000)
; XButton1 & WheelDown:: ToolTipTimed("XB1 & WDown", 1000)
XButton1 & WheelUp::Delete
XButton1 & WheelDown::BackSpace

; ~MButton & WheelUp:: ToolTipTimed("MB & WUp", 1000)
; ~MButton & WheelDown:: ToolTipTimed("MB & WDown", 1000)
; RButton & LButton:: ToolTipTimed("RB & LB", 1000)
MButton & LButton::J   ; Youtube 10 sec back
MButton & RButton::Right
RButton & MButton::Left

MButton::MButton
XButton1::XButton1
XButton2::XButton2
WheelUp::WheelUp
WheelDown::WheelDown

;1 Lx----dd
;s M-x-----
;t R--x----
;  2---x---
;  1----x--
