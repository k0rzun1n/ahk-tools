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

RButton & XButton2::Space
RButton & XButton1::Enter

XButton1 & XButton2::!F4
; ToolTipTimed("XB1 & XB2", 1000)
XButton2 & XButton1:: ToolTipTimed("XB2 & XB1", 1000)

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

global mw_pos := [[0.95, 0.95], [0.975, 0.04], [0.05, 0.05], [0.5, 0.5], [0.05, 0.95]]
global mw_pl := mw_pos.Length
global mw_i := 0 
MButton & WheelUp:: {
    global mw_pos
    global mw_i
    Move2Window(mw_pos[1 + mw_i := Mod(mw_i + 1, mw_pl)]*)
}
MButton & WheelDown:: {
    global mw_pos
    global mw_i
    Move2Window(mw_pos[1 + mw_i := Mod(mw_i - 1 + mw_pl, mw_pl)]*)
}

RButton & WheelUp:: SoundGetVolume() < 42 ? Send("{Volume_Up}") : 0
RButton & WheelDown:: Send("{Volume_Down}")

; XButton1 & WheelUp::   ToolTipTimed("XB1 & WUp", 1000)
; XButton1 & WheelDown:: ToolTipTimed("XB1 & WDown", 1000)
XButton1 & WheelUp::Delete
XButton1 & WheelDown::BackSpace

; ~MButton & WheelUp:: ToolTipTimed("MB & WUp", 1000)
; ~MButton & WheelDown:: ToolTipTimed("MB & WDown", 1000)
; RButton & LButton:: ToolTipTimed("RB & LB", 1000)
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
WheelUp::WheelUp
WheelDown::WheelDown

;1 Lx----dd
;s M-x-----
;t R--x----
;  2---x---
;  1----x--
