; #Requires AutoHotkey 2.0+
; #SingleInstance Force

; Esc:: ExitApp()

GKSP := GetKeyState.Bind(, "P")
GKST := GetKeyState.Bind(, "T")
GKSPT := (key) => GetKeyState(key, "P") || GetKeyState(key, "T")
GKS := GetKeyState

spd := 1
kb2mouse(up := "Up", left := "Left", down := "Down", right := "Right") {
    dx := spd * (GKSP(right) - GKSP(left)) ;R-L
    dy := spd * (GKSP(down) - GKSP(up)) ;D-U
    DllCall("mouse_event", "UInt", 0x0001, "Int", dx, "Int", dy, "UInt", 0, "UPtr", 0)
}

Move2Window(w_frac := 0.5, h_frac := 0.5, w_offset := 0, h_offset := 0) {
    WinGetPos &x, &y, &w, &h, "A"
    DllCall("SetCursorPos",
        "int", x + w_offset + w_frac * w,
        "int", y + h_offset + h_frac * h)
}

shorts2watch() { ;reopen YT "shorts" page in "watch" mode
    ClipSaved := ClipboardAll()
    ; SendEvent "{F6}^c"
    SendEvent "!d^c"
    link := RegExReplace(A_Clipboard, "/shorts/", "/watch/", &repCount)
    if (repCount == 1) {
        Sleep 350
        A_Clipboard := link
        SendEvent "^v{Enter}"
    } else {
        ToolTipTimed "not a shorts video", 2000
    }
    Sleep 350
    A_Clipboard := ClipSaved
}

ToolTipTimed(Text?, Timeout := 3000, x?, y?, WhichToolTip?) {
    ToolTip(Text?, x?, y?, WhichToolTip?)
    SetTimer(ToolTip, -Timeout)
}
; ToolTipTimed("zzz", 2000)

; ToolTipFollow := (Text?, TimeOut := 5000, WhichToolTip?) => (
; 	tick := A_TickCount, SetTimer(Update, 100),
; 	Update() => (
; 		(A_TickCount-tick < TimeOut)
; 		? ToolTip(Text?, , , WhichToolTip?)
; 		: (SetTimer(, 0), ToolTip(, , , WhichToolTip?))
; 	)
; )
; ToolTipFollow("qweqwewqe",2000,)

class CircularBuf {
    __New(count) {
        this.buf := []
        this.buf.Default := 0
        this.buf.Length := count
        this.0b_start_id := 0 ;0-based start id
        this.last := 0
    }
    Length => this.buf.Length
    getFirst() => this.buf[1 + this.0b_start_id]
    getLast() => this.last
    setNext(val) {
        this.last := this.buf[1 + this.0b_start_id] := val
        this.0b_start_id := Mod(1 + this.0b_start_id, this.buf.Length)
        return val
    }
    ;n before last, 0 is equivalent to getLast
    getNB4Last(n) => this.buf[Mod1(this.0b_start_id - n + this.buf.Length, this.buf.Length)]
}
Mod1(x, div) => 1 + Mod(x - 1, div)


GetInputLangID(hWnd := '') {
    (!hWnd) && hWnd := WinActive('A'), childPID := ''
    If WinGetProcessName(hWnd) = 'ApplicationFrameHost.exe' {
        pid := WinGetPID(hWnd)
        For ctl in WinGetControls(hWnd)
            DllCall('GetWindowThreadProcessId', 'Ptr', ctl, 'UIntP', childPID)
        Until childPID != pid
        DetectHiddenWindows True
        hWnd := WinExist('ahk_pid' childPID)
    }
    threadId := DllCall('GetWindowThreadProcessId', 'Ptr', hWnd, 'UInt', 0)
    lyt := DllCall('GetKeyboardLayout', 'Ptr', threadId, 'UInt')
    Return langID := Format('{:#x}', lyt & 0x3FFF)
}

GetInputLangName(langId) {
    Static LOCALE_SENGLANGUAGE := 0x1001
    charCount := DllCall('GetLocaleInfo', 'UInt', langId, 'UInt', LOCALE_SENGLANGUAGE, 'UInt', 0, 'UInt', 0)
    localeSig := Buffer(size := charCount << 1)
    DllCall('GetLocaleInfo', 'UInt', langId, 'UInt', LOCALE_SENGLANGUAGE, 'Ptr', localeSig, 'UInt', size)
    Return StrGet(localeSig)
}

; (╯°□°)╯︵ ɓuᴉxǝpuᴉ-pǝsɐq-⇂
;
; https://www.reddit.com/r/ProgrammingLanguages/comments/klvtms/thoughts_on_using_1_based_indexes/
; u/totally-not-god
;   I would be very careful when it comes to inventing new languages with 1-based indexing.
;   These languages have a perfect 1.0 correlation with wars and disasters.
;   For example, when COBOL and FORTRAN were invented we had the Vietnam war.
;   When SMALLTALK was invented we had the US-Panama conflict.
;   When R was invented we had the first Gulf War.
;   In a word, 1-based languages only bring pain and suffering.
;   Stay away from them to save lives.
; u/raevnos
;   The World Trade Center bombing, Waco,
;   the battle of Mogadishu (of Black Hawk Down fame),
;   the Burundi civil war, and Lua all happened in 1993.
