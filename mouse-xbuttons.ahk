XButton1 & RButton::^c
RButton & XButton1::^v
RButton & XButton2:: Send "{Enter}"
XButton2 & RButton::AltTab
#HotIf !GKSP("XButton2") ;prevent context menu on XB2&RB
RButton::RButton
#HotIf
XButton1::XButton1
XButton2::XButton2
