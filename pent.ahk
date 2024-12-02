#Requires AutoHotkey 2.0+
#SingleInstance Force
CoordMode "Mouse"
pi := 4 * ATan(1)
deg2rad := pi / 180

5::
Esc:: ExitApp()

MouseGetPos &xm, &ym
loop 5 * 3 {
    s := (18 + 72 * Mod(4 - 2 * A_Index, 5)) * deg2rad
    x0 := Cos(s)
    y0 := -Sin(s)
    f := (18 + 72 * Mod(2 - 2 * A_Index, 5)) * deg2rad
    x1 := Cos(f)
    y1 := -Sin(f)
    n := 300
    scale := 200
    loop n {
        phase := (A_Index - 1) / n ; [0,1]
        overshot := 0.25 ;[-0.25, 1.25]
        phase := phase * (1 + 2 * overshot) - overshot
        x := Random() * 5 + scale * (x0 + (x1 - x0) * phase)
        y := Random() * 5 + scale * (y0 + (y1 - y0) * phase)
        ; ToolTip x " " y
        DllCall("SetCursorPos", "int", x + xm, "int", y + ym)
        if (A_Index == 1)
            Send("{LButton down}")
        if Random() < 0.09 {
            ; MsgBox 100
            x += Random(-1, 1) * 6
            y += Random() * 200
            Sleep 5
            DllCall("SetCursorPos", "int", x + xm, "int", y + ym)
        }
        Sleep 5

    }
    Send "{LButton up}"
}
Send "{LButton up}"
ExitApp()
