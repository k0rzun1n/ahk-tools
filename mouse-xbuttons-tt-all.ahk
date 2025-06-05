#Include utils.ahk
Esc:: ExitApp()

RButton & XButton2:: ToolTipTimed("RB & XB2", 1000)
RButton & XButton1:: ToolTipTimed("RB & XB1", 1000)

XButton2 & RButton:: ToolTipTimed("XB2 & RB", 1000)
XButton2 & LButton:: ToolTipTimed("XB2 & LB", 1000)
XButton1 & RButton:: ToolTipTimed("XB1 & RB", 1000)
XButton1 & LButton:: ToolTipTimed("XB1 & LB", 1000)

XButton1 & XButton2:: ToolTipTimed("XB1 & XB2", 1000)
XButton2 & XButton1:: ToolTipTimed("XB2 & XB1", 1000)

#HotIf !(GKSP("LButton") || GKSP("MButton" || GKSP("XButton1") || GKSP("XButton2"))) ;prevent context menu on &RB
RButton::RButton
#HotIf GKSP("LButton")
WheelUp:: ToolTipTimed("LB & WUp", 1000)
WheelDown:: ToolTipTimed("LB & WDown", 1000)
XButton2:: ToolTipTimed("LB & XB2", 1000)
XButton1:: ToolTipTimed("LB & XB1", 1000)
MButton:: ToolTipTimed("LB & MB", 1000)
RButton:: ToolTipTimed("LB & RB", 1000)
#HotIf

~MButton & WheelUp:: ToolTipTimed("MB & WUp", 1000)
~MButton & WheelDown:: ToolTipTimed("MB & WDown", 1000)
RButton & WheelUp:: ToolTipTimed("RB & WUp", 1000)
RButton & WheelDown:: ToolTipTimed("RB & WDown", 1000)
RButton & LButton:: ToolTipTimed("RB & LB", 1000)
RButton & MButton:: ToolTipTimed("RB & MB", 1000)
MButton & LButton:: ToolTipTimed("MB & LB", 1000)
MButton & RButton:: ToolTipTimed("MB & RB", 1000)
MButton & XButton2:: ToolTipTimed("MB & XB2", 1000)
MButton & XButton1:: ToolTipTimed("MB & XB1", 1000)
XButton2 & WheelUp:: ToolTipTimed("XB2 & WUp", 1000)
XButton2 & WheelDown:: ToolTipTimed("XB2 & WDown", 1000)
XButton1 & WheelUp:: ToolTipTimed("XB1 & WUp", 1000)
XButton1 & WheelDown:: ToolTipTimed("XB1 & WDown", 1000)
XButton2 & MButton:: ToolTipTimed("XB2 & MB", 1000)
XButton1 & MButton:: ToolTipTimed("XB1 & MB", 1000)

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
