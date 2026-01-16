#Requires AutoHotkey v1.1.0+
;==============================================================
; getClassName — Gets the window class name for a given HWND
;
; GitHub: https://github.com/SevenKeyboard/get-class-name
; Author: SevenKeyboard Ltd. (2026)
; License: The Unlicense
;
; Documentation / References:
;   GetClassName function (winuser.h)
;     https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getclassname
;==============================================================
class VersionManager_getClassName
{
    static _ := VersionManager_getClassName._init()
    _init()    {
        global
        GETCLASSNAME_VERSION := "1.0.0"
    }
}
getClassName(hWnd, nMaxCount:=1024)    { ;  MAX_CLASS_NAME
    varSetCapacity(lpClassName, (A_IsUnicode?2:1)*nMaxCount, 0)
    return (dllCall("User32.dll\GetClassName", "Ptr",hWnd, "Ptr",&lpClassName, "Int",nMaxCount, "Int"))
        ?strGet(&lpClassName)
        :""
}