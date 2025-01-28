#Include utils.ahk
; Esc::ExitApp()

RButton & XButton2::^c
RButton & XButton1::^v

XButton2 & RButton::AltTab
XButton2 & LButton::ShiftAltTab
XButton1 & RButton::^Tab
XButton1 & LButton::^+Tab

XButton2 & WheelUp:: Send "^{WheelUp}"
XButton2 & WheelDown:: Send "^{WheelDown}"

XButton1 & XButton2::Space
XButton2 & XButton1::Enter

#HotIf !(GKSP("XButton2") || GKSP("LButton") || GKSP("MButton")) ;prevent context menu on &RB
RButton::RButton
#HotIf GKSP("LButton")
XButton2::Esc ;cancel drag
XButton1:: ToolTipTimed("LB & XB1", 1000)
MButton:: ToolTipTimed("LB & MB", 1000)
RButton:: ToolTipTimed("LB & RB", 1000)
#HotIf

~MButton & WheelUp:: ToolTipTimed("MB & WUp", 1000)
~MButton & WheelDown:: ToolTipTimed("MB & WDown", 1000)
RButton & WheelUp:: ToolTipTimed("RB & WUp", 1000)
RButton & WheelDown:: ToolTipTimed("RB & WDown", 1000)
XButton1 & WheelUp:: ToolTipTimed("XB1 & WUp", 1000)
XButton1 & WheelDown:: ToolTipTimed("XB1 & WDown", 1000)
RButton & LButton:: ToolTipTimed("RB & LB", 1000)
RButton & MButton:: ToolTipTimed("RB & MB", 1000)
MButton & LButton:: ToolTipTimed("MB & LB", 1000)
MButton & RButton:: ToolTipTimed("MB & RB", 1000)
MButton & XButton1:: ToolTipTimed("MB & XB1", 1000)
MButton & XButton2:: ToolTipTimed("MB & XB2", 1000)
XButton1 & MButton:: ToolTipTimed("XB1 & MB", 1000)
XButton2 & MButton:: ToolTipTimed("XB2 & MB", 1000)

MButton::MButton
XButton1::XButton1
XButton2::XButton2

; 1 near; 2 far
; d default is good; x impossible
;   2nd
;   LMR21UD
;1 Lx----dd
;s M-x-----
;t R--x----
;  2---x---
;  1----x--
