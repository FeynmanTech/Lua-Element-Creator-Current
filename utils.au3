#include <GDIPlus.au3> ;For the graphics
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiConstantsEx.au3>
#include <AVIConstants.au3>
#include <TreeViewConstants.au3>

func disp ( $dat, $title )
	Local $r = MsgBox(0, $title, $dat)
	Return $r
EndFunc

func prompt_YesNo ( $dat, $title )
	Local $r = MsgBox(4, $title, $dat)
	Return $r
EndFunc

func window ( $t, $w, $h )
	Return GUICreate( $t, $w, $h )
EndFunc

func line( $x1, $y1, $x2, $y2 )
	GUICtrlSetGraphic(-1, $GUI_GR_LINE, $x1, $y1, $x2 - $x1, $y2 - $y1)
EndFunc

func FileAssoc($sExt, $sApplication)
    RunWait(@ComSpec & " /c ASSOC ." & $sExt & "=ExTest", "", @SW_HIDE)
    RunWait(@ComSpec & " /c FTYPE ExTest=" & $sApplication , "", @SW_HIDE)
EndFunc

Func SetPixel($XCoord, $YCoord, $Color)

  Local $dc = DllCall("user32.dll", "int", "GetDC", "hwnd", 0)

  If Not IsArray($dc) Then Return -1

  DllCall("gdi32.dll", "long", "SetPixel", "long", $dc[0], "long", $XCoord, "long", $YCoord, "long", _
 "0x" & StringRegExpReplace(hex($Color,6), "(..)(..)(..)", "\3\2\1")) ;
  DllCall("user32.dll", "int", "ReleaseDC", "hwnd", 0, "hwnd", $dc[0])
EndFunc ;==>_PixelSetColor

Func GetUrlData ( $url )
	Local $data = InetRead ( $url )
	Return BinaryToString ( $data )
EndFunc
