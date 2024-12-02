#Requires AutoHotkey 2.0+
#SingleInstance Force
; InstallKeybdHook
; KeyHistory
; ListHotkeys
; #Win !Alt ^Ctrl +Shift
; *Q any modifier; ~Q keep Q press; Send {Blind} keep modifiers
; sc027==; pi==4*ATan(1);

#Include utils.ahk
#Include mouse-xbuttons.ahk

; *Esc:: ExitApp()

caps_switch(state) {
    global capsOn := state
    onoff := state ? "On" : "Off"
    SetCapsLockState "Always" . onoff ;just to light up the caps LED
    Hotkey "Space & u", onoff ;bound to AltTab so it blocks Space even in Hotif 0
    Hotkey "Space & h", onoff
}

caps_switch(0)
CapsLock:: caps_switch(1) ;spams repeat, but breaks with keywait(caps)

RShift & Esc:: return ;RShift stops working without this line
RShift up::
CapsLock up:: { ;double tap to lock
    static cb := CircularBuf(2)
    caps_switch(cb.setNext(A_TickCount) - cb.getFirst() < 350)
}

ijkl_mouse := kb2mouse.Bind("I", "J", "K", "L") ;mouse movement right hand
wasd_mouse := kb2mouse.Bind("W", "A", "S", "D") ;mouse movement left hand

mult := 3 ;speed adjustment step
mn := 8 ;minimum speed
mx := mn * mult * mult * mult ;maximum speed
spd := mn * mult ;speed|sensitivity

#HotIf capsOn ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

*1:: global spd := 1
*2:: global spd := mn * mult
*3:: global spd := 1150 ;from the top lands on fullscreen YT timeline
*q:: global spd := max(mn, spd / mult) ;reduce speed
*e:: global spd := min(mx, spd * mult) ;increase speed

7:: Move2Window(0, 0, 128, 32) ;top left, menus and draggable area
4::
8:: Move2Window ;window center
9:: Move2Window(0.5, 1, 0, -79) ;bottom center, fullscreen YT timeline
0:: Move2Window(1, 0, -32, 32) ;top right, close button

; 5:: Run "pent.ahk" ;draw a shape

w::^+z  ;redo
z::^z   ;undo
x::^x   ;cut
c::^c   ;copy
v::^v   ;paste

Space & u::AltTab
Space & h::ShiftAltTab
u::^Tab
h::^+Tab

;L/M/R Mouse Buttons
*d:: {
    Send "{Blind}{LButton Down}" ; toggled Caps breaks it without Blind
    KeyWait("d")
    Send "{Blind}{LButton Up}"
}
*s:: {
    Send "{Blind}{MButton Down}"
    KeyWait("s")
    Send "{Blind}{MButton Up}"
}
*a:: { ; *a::RButton ; will open context menu on Space&a release
    Send "{Blind}{RButton Down}"
    KeyWait("a")
    Send "{Blind}{RButton Up}"
}
; pinkies, single hand drag
*/::LButton
Space & /::RButton
Space & LShift::LButton

*r:: Send "{Blind}{WheelUp}"
*f:: Send "{Blind}{WheelDown}"
Space & r:: Send "!{WheelUp}" ;faster scroll
Space & f:: Send "!{WheelDown}"

*i:: ijkl_mouse()
*j:: ijkl_mouse()
*k:: ijkl_mouse()
*l:: ijkl_mouse()
Space & w:: wasd_mouse()
Space & a:: wasd_mouse()
Space & s:: wasd_mouse()
Space & d:: wasd_mouse()

;ctrl is used for multicursor click in vscode and caps&space&ijkl(arrows)
;wasd as arrows and pgup/pgdn/home/end
#w::Up
#a::Left
#s::Down
#d::Right
!w::PgUp
!a::Home
!s::PgDn
!d::End
;ijkl as arrows
Space & i::Up
Space & j::Left ;ctrl works
Space & k::Down
Space & l::Right
<+i::+Up ;>+ is used for PotPlayer sub search (use winactive?)
<+j::+Left
<+k::+Down
<+l::+Right
!i::^!Up ;add cursor above
!j::^Up ;go up 1 line (^#wasd same but buggy)
!k::^!Down
!l::^Down ;# might be better for !ijkl, but #L can't be overriden
^u::^u
!u::^u ;cursor undo
^o::^+u
!o::^+u ;cursor redo

.::^w ;close tab
Space & .::!F4 ;close window
,::^+t ;reopen
Space & ,::^t ;new tab
[::Esc ;escape
b::Delete
n::BackSpace
`::Enter 
Tab::Space 
; Space & b::Enter 
; Space & n::Space 
o::^/ ;comment in vscode
p::^s ;save
sc027::!q ;run
'::^f ;search
Space & ':: Send(GKSP("Shift") ? "^!d" : "^d") ;move/add cursor to next occurence

g:: { ;spam click
    Send "{LButton Down}"
    Send "{LButton Up}"
    Sleep(30)
}
Space & g:: return
Space & g up:: { ;small skip
    Send "{Space}"
    Sleep(12)
    Send "{Space}"
}
m:: Send "{Volume_Mute}"
y:: { ;switch language
    Send "{Ctrl Down}{Shift Down}{Shift Up}{Ctrl Up}"
    ToolTipTimed GetInputLangName(GetInputLangID()), 2000
}
t:: shorts2watch ;reopen YT "shorts" page in "watch" mode
Space & t:: Send "!d!{Enter}" ;duplicate tab

;free? 4560-=p[]\o;,.

#HotIf