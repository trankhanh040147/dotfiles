#Requires AutoHotkey v2.0
+!s:: {  ; Shift + Alt + S
    golandWindows := []  ; array to hold GoLand window IDs
    winList := WinGetList("ahk_exe goland64.exe")  ; get all GoLand windows

    if winList.Length = 0 {
        ; GoLand not running → launch it
        Run '"C:\Program Files\JetBrains\GoLand\bin\goland64.exe"'
        return
    }

    ; Find currently active GoLand window
    current := WinActive("A")

    ; Find index of current in winList (if it is a GoLand window)
    currentIndex := 0
    Loop winList.Length {
        if (winList[A_Index] = current) {
            currentIndex := A_Index
            break
        }
    }

    ; Determine the next window in the list (wrap around if needed)
    nextIndex := (currentIndex < winList.Length) ? currentIndex + 1 : 1

    ; Activate next GoLand window
    WinActivate(winList[nextIndex])
}
