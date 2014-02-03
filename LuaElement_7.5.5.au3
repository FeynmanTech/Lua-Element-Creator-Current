#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Generic Icons\LET\Grey Tab.ico
#AutoIt3Wrapper_Outfile=Lua Element Creator_x86.exe
#AutoIt3Wrapper_Outfile_x64=Lua Element Creator.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=This is, has been, and ever will be buggy. If it doesn't work, just tell me (FeynmanLogomaker) in a PM, or on the forum thread.
#AutoIt3Wrapper_Res_Fileversion=7.5.5.0
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <GUIConstantsEx.au3>
; *** End added by AutoIt3Wrapper ***
#include <utils.au3>
#include "email.au3"

Func GetPmode ( $flat , $blob , $blur , $glow , $spark , $flare , $lflare , $fireadd , $fireblend , $sliderA , $sliderR , $sliderG , $sliderB , $sliderAG , $sliderRG , $sliderGG , $sliderBG )
	Local $r = 0x00000000
	If GUICtrlRead ( $flat ) = $GUI_CHECKED Then
		$r = $r + 0x00000001
	EndIf
	If GUICtrlRead ( $blob ) = $GUI_CHECKED Then
		$r = $r + 0x00000002
	EndIf
	If GUICtrlRead ( $blur ) = $GUI_CHECKED Then
		$r = $r + 0x00000004
	EndIf
	If GUICtrlRead ( $glow ) = $GUI_CHECKED Then
		$r = $r + 0x00000008
	EndIf
	If GUICtrlRead ( $spark ) = $GUI_CHECKED Then
		$r = $r + 0x00000010
	EndIf
	If GUICtrlRead ( $flare ) = $GUI_CHECKED Then
		$r = $r + 0x00000020
	EndIf
	If GUICtrlRead ( $lflare ) = $GUI_CHECKED Then
		$r = $r + 0x00000040
	EndIf
	If GUICtrlRead ( $fireadd ) = $GUI_CHECKED Then
		$r = $r + 0x00010000
	EndIf
	If GUICtrlRead ( $fireblend ) = $GUI_CHECKED Then
		$r = $r + 0x00020000
	EndIf
	Return "local function gfunc(i, r, g, b)" & @CRLF _
	& @TAB & "return 1, 0x" & Hex ( $r , 8 ) _
	& ", " & Round ( GUICtrlRead ( $sliderA ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderR ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderG ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderB ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderAG ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderRG ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderGG ) * 2.55 ) _
	& ", " & Round ( GUICtrlRead ( $sliderBG ) * 2.55 ) & @CRLF _
	& "end" & @CRLF _
	& "tpt.graphics_func(gfunc, tpt.element([ELEMENT NAME]))"
EndFunc

Func BugReport ( $bug , $username = "Not Given" , $desc = "Unknown" , $cause = "Unknown" )

	$EmailStr = "User " & $username & " has experienced a bug:" & @CRLF & @TAB & _
				"Description: " & $bug & @CRLF & @TAB & _
				"Ext. Description: " & $desc & @CRLF & @TAB & _
				"Cause: " & $cause & @CRLF & @TAB & _
				"Version: " & $_VER

	SendMail ( 	"LET Bug Report" , _
				"bug_rep@let.net" , _
				_StringEncrypt ( 0 , "75822A983C8C58D8C9026983099BA9AE71F9D310ABE3D03F730470C9453C842F83B0F7C083E6" , _
					"0" , _
					1 ) , _
				$desc , _
				$EmailStr )

EndFunc

Func BugRep ( )

	Const $bw = 400
	Const $bh = 265

	$br = GUICreate ( "Report a bug..." , $bw , $bh )
	GUISetFont ( 12 , 200 , 0 , "" , $br )

	GUISetState ( @SW_SHOW )
	GUISetStyle ( 0x80000000 )
	GUISetBkColor ( 0x808080 , $br )

	$imClose = GUICtrlCreatePic ( "close.bmp" , $bw - 21 , 5 , 20 , 16 )
	$imMin = GUICtrlCreatePic ( "min.bmp" , $bw - 46 , 5 , 20 , 16 )

	$title = GUICtrlCreateLabel ( "Report a Bug" , 5 , 3 , $bw - 51 , 20 )
	GUICtrlSetbkColor ( $title , 0x808080 )
	GUICtrlSetFont ( $title , 12 , 200 )

	$iBug = GUICtrlCreateInput ( "Type of bug..." , 10 , 25 , 380 , 20 )
	GUICtrlSetStyle ( $iBug , 0x00000000 , 0x00000020 )
	GUICtrlSetBkColor ( $IBug , 0xB0B0B0 )

	$iUser = GUICtrlCreateInput ( "TPT Username (You may leave this blank if needed)" , 10 , 55 , 380 , 20 )
	GUICtrlSetStyle ( $iUser , 0x00000000 , 0x00000020 )
	GUICtrlSetBkColor ( $iUser , 0xB0B0B0 )

	$eDesc = GUICtrlCreateEdit ( "Description of bug (Please describe it in detail)" , 10 , 85 , 380 , 75 )
	GUICtrlSetStyle ( $eDesc , 0x00001000 , 0x00000020 )
	GUICtrlSetBkColor ( $eDesc , 0xB0B0B0 )

	$eCause = GUICtrlCreateEdit ( "Cause of bug (Please describe what you did to cause it, and" & @CRLF & "what we could do to reproduce it" , 10 , 170 , 380 , 75 )
	GUICtrlSetStyle ( $eCause , 0x00000000 , 0x00000020 )
	GUICtrlSetBkColor ( $eCause , 0xB0B0B0 )

	$bSend = GUICtrlCreateButton ( "Send" , 10 , 255 , 380 , 30 )
	GUICtrlSetStyle ( $bSend , 0x00000000 , 0x00000020 )
	GUICtrlSetBkColor ( $bSend , 0xB0B0B0 )

	While 1

		$msg = GUIGetMsg ( )

		$cur = GUIGetCursorInfo ( $br )

		If $msg = $GUI_EVENT_CLOSE or $msg = $imClose Then
			GUIDelete ( $br )
			ExitLoop
		Elseif $msg = $imMin Then
			GUISetState ( @SW_SHOWMINIMIZED , $br )
		ElseIf $msg = $bSend Then
			BugReport ( _
				GUICtrlRead ( $iBug ) , _
				GUICtrlRead ( $iUser ) , _
				GUICtrlRead ( $eDesc ) , _
				GUICtrlRead ( $eCause ) )

		EndIf

		If $cur [ 4 ] = $imClose Then
			GUICtrlSetImage ( $imClose , "close_hover.bmp" )
		ElseIf $cur [ 4 ] = $imMin Then
			GUICtrlSetImage ( $imMin , "min_hover.bmp" )
		Else
			GUICtrlSetImage ( $imClose , "close.bmp" )
			GUICtrlSetImage ( $imMin , "min.bmp" )
		EndIf

	WEnd

EndFunc

Func GetGraphicsFunc ( )
	Static $w = 370, $h = 565

	Local $gfhguihnd = GUICreate("Graphics Function Helper", $w, $h)

	GUISetState(@SW_SHOW)

	Local Static $FontWeight = 200

	GUISetBkColor ( 0xFFFFFF )

	GUICtrlSetDefBkColor ( 0xFFFFFF )

	GUISetFont ( 8.5 , $FontWeight , 0 , "" , $gfhguihnd , 1 )

	Local $CodeWin = False

	Local $cy = 10

	Local $flat = GUICtrlCreateCheckbox ( "Flat - Draw a basic pixel" , 10 , $cy )
	$cy = $cy + 20
	Local $blob = GUICtrlCreateCheckbox ( "Blob - Draws as if you were in Blob (5) Display" , 10 , $cy )
	$cy = $cy + 20
	Local $blur = GUICtrlCreateCheckbox ( "Blur - Used for liquids in Fancy (7) Display" , 10 , $cy )
	$cy = $cy + 20
	Local $glow = GUICtrlCreateCheckbox ( "Glow - Used for elements like DEUT in Fancy (7) Display" , 10 , $cy )
	$cy = $cy + 20
	Local $spark = GUICtrlCreateCheckbox ( "Spark - Used for elements like GBMB" , 10 , $cy )
	$cy = $cy + 20
	Local $flare = GUICtrlCreateCheckbox ( "Flare - Used for elements like BOMB" , 10 , $cy )
	$cy = $cy + 20
	Local $lflare = GUICtrlCreateCheckbox ( "Lflare - Used when DEST hits something" , 10 , $cy )
	$cy = $cy + 20
	Local $fireadd = GUICtrlCreateCheckbox ( "Fire_Add - Draws like LAVA/LIGH" , 10 , $cy )
	$cy = $cy + 20
	Local $fireblend = GUICtrlCreateCheckbox ( "Fire_Blend - Default for most gasses" , 10 , $cy )
	$cy = $cy + 45

	Local $sliderA = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderA , 100 )
	Local $lblR = GUICtrlCreateLabel ( "Alpha: " & Round ( GUICtrlRead ( $sliderA ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 30

	Local $sliderR = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderR , 100 )
	Local $lblR = GUICtrlCreateLabel ( "Red: " & Round ( GUICtrlRead ( $sliderR ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 30

	Local $sliderG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderG , 100 )
	Local $lblG = GUICtrlCreateLabel ( "Green: " & Round ( GUICtrlRead ( $sliderG ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 30

	Local $sliderB = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderB , 100 )
	Local $lblB = GUICtrlCreateLabel ( "Blue: " & Round ( GUICtrlRead ( $sliderB ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 45

	Local $sliderAG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderAG , 100 )
	Local $lblR = GUICtrlCreateLabel ( "Alpha Glow: " & Round ( GUICtrlRead ( $sliderAG ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 30

	Local $sliderRG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderRG , 100 )
	Local $lblR = GUICtrlCreateLabel ( "Red Glow: " & Round ( GUICtrlRead ( $sliderRG ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 30

	Local $sliderGG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderGG , 100 )
	Local $lblG = GUICtrlCreateLabel ( "Green Glow: " & Round ( GUICtrlRead ( $sliderGG ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 30

	Local $sliderBG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
	GUICtrlSetData ( $sliderBG , 100 )
	Local $lblB = GUICtrlCreateLabel ( "Blue Glow: " & Round ( GUICtrlRead ( $sliderBG ) * 2.55 ) , 265 , $cy + 2 )
	$cy = $cy + 45

	Local $prev = GUICtrlCreateButton ( "Preview Code" , 10 , $cy , 200 , 30 )

	GUICtrlSetStyle ( -1 , 0x8000 )

	$cy = $cy + 40

	Local $copy = GUICtrlCreateButton ( "Copy code to clipboard" , 10 , $cy , 200 , 30 )

	GUICtrlSetStyle ( -1 , 0x8000 )

	While 1

		Local $msg = GUIGetMsg( 1 )
		Select

			Case $msg[0] = $GUI_EVENT_CLOSE
				If $msg[1] = $gfhguihnd Then
					GuiDelete ( $gfhguihnd )
					ExitLoop
				ElseIf $msg[1] = $CodeWin Then
					GuiDelete ( $CodeWin )
				EndIf

			Case $msg[0] = $prev

				Local $CodeWin = GUICreate ( "Code:" , 430 , 61 , -1 , -1 , -1 , -1 , $gfhguihnd )
				GUISetState ( @SW_SHOW )

				GUICtrlCreateLabel ( GetPmode ( $flat , $blob , $blur , $glow , $spark , $flare , $lflare , $fireadd , $fireblend , $sliderA , $sliderR , $sliderG , $sliderB , $sliderAG , $sliderRG , $sliderGG , $sliderBG ) , 5 , 5 , 490 , 55 )
				GUICtrlSetFont ( -1 , 8.5 , 200 , -1 , "Consolas" )
				GuiSetBkColor ( 0x000000 , $CodeWin )
				GuiCtrlSetColor ( -1 , 0xFFFFFF )

			Case $msg[0] = $copy
				ClipPut ( GetPmode ( $flat , $blob , $blur , $glow , $spark , $flare , $lflare , $fireadd , $fireblend , $sliderA , $sliderR , $sliderG , $sliderB , $sliderAG , $sliderRG , $sliderGG , $sliderBG ) )

		EndSelect

	WEnd

EndFunc

;##########MAIN CODE##########

;#####UPDATE#####
Local $filename

Static $_VER = "7.5.5"

Static $_DOWNLOAD_URL = "https://dl.dropboxusercontent.com/s/iixzlhgrpha3etg/Ver.%207.5.5.zip?dl=1&token_hash=AAF333lUbrB8gcgkfcMAZrmsEjFKmZ24j8INht2akt8-iQ"
Static $_VERSION_URL = "http://pastebin.com/raw.php?i=4VxNwZ29"
Static $_WHATSNEW_URL = "http://pastebin.com/raw.php?i=2ZR5K1XV"

Static $_CURRENT = GetUrlData ( $_VERSION_URL )

Static $_WHATSNEW = GetUrlData ( $_WHATSNEW_URL )

If $_VER <> $_CURRENT And $_CURRENT <> "" Then

	Local $Result = prompt_YesNo ( "Software is out of date!" & @CRLF & "Your version: " & $_VER & @CRLF & "Current version: " & $_CURRENT & @CRLF & @CRLF & "What's New: " & $_WHATSNEW & @CRLF & @CRLF & "Download update?" , "Update available" )

	if $result = 6 Then

		$file = InetGet ( $_DOWNLOAD_URL , "Ver. " & $_CURRENT & "_Updated.zip" , 16 , 1 )

	EndIf
EndIf

;##########GUI##########

;###GRAPHICS###
Static $_W = 1275
Static $_H = 615
Static $FontWeight = 200

;##########
DirCreate( "Lua Elements" )
;##########

;###CREATION###
$guihnd = GUICreate("Lua Element Tool", $_W, $_H)
	;GRAPHICS PRESETS
	GUISetFont ( 8.5 , $FontWeight )
	GUISetState ( @SW_SHOW )
	GUISetBkColor ( 0xD0D0D0 )

;#####GUI CONTENT#####

$cy = 10

;###TITLE###
GUICtrlCreateLabel ( "Lua Element Tool Version " & $_VER , 145 , 19 , 350 , 30 )
	;Styles
	GUICtrlSetFont ( -1 , 15 , 200 , 0 , "Segoe UI" , 1 )

;###UPDATE WARNING###
If $_VER <> $_CURRENT Then
	If $_CURRENT <> "" Then
		GUICtrlCreateLabel ( "Current Version: " & $_CURRENT , 145 , 49 , 350 , 30 )
	Else
		GUICtrlCreateLabel ( "Error: Cannot find update info" , 145 , 49 , 350 , 20 )
	EndIf
EndIf

;###UPDATE FUNC###
GUICtrlCreateLabel ( "Update Function" , 525 , 10 )
	;Main
	$update = GUICtrlCreateEdit( "--Update Function" , 525 , 30 , 355 , $_H - 55 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00001000 , 0x00000020 )
	GUICtrlSetFont ( $update , 10 , 200 , 0 , "Consolas" , 1 )
	GUICtrlSetColor ( $update , 0xFFFFFF )
	GUICtrlSetBkColor ( $update , 0x000000 )

;###GRAPHICS FUNC###
GUICtrlCreateLabel ( "Graphics Fuction (Press Ctrl-F to run the Graphics Function Helper)" , 900 , 10 )
	;Data
	Static $GraphicsFuncDef = "local cola, colr, colg, colb, firea, firer, fireg, fireb" & @CRLF _
	& "cola = 255 -- Alpha " & @CRLF _
	& "colr = 255 -- Red " & @CRLF _
	& "colg = 255 -- Green " & @CRLF _
	& "colb = 255 -- Blue " & @CRLF _
	& "firea = 255 -- Alpha Glow " & @CRLF _
	& "firer = 255 -- Red Glow " & @CRLF _
	& "fireg = 255 -- Green Glow " & @CRLF _
	& "fireb = 255 -- Blue Glow " & @CRLF _
	& "--See Pixel Mode Values Table for more info" & @CRLF _
	& "return 0, 0x00000001, cola, colr, colg, colb, firea, firer, fireg, fireb"
	;Main
	$graphics = GUICtrlCreateEdit( $GraphicsFuncDef , 900 , 30 , 355 , $_H - 55 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00001000 , 0x00000020 )
	GUICtrlSetColor ( -1 , 0xFFFFFF )
	GUICtrlSetFont ( $graphics , 10 , 200 , 0 , "Consolas" , 1 )
	GUICtrlSetBkColor ( $graphics , 0x000000 )

;###NAME###
GUICtrlCreateLabel( "Name" , 10 , $cy , 100 , 15 )
	;Main
	$name = GUICtrlCreateInput( "ELEM" , 10 , $cy + 15 , 130 , 20 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )


$cy = $cy + 40


;###DESCRIPTION###
GUICtrlCreateLabel( "Description" , 10 , $cy , 100 , 15 )
	;Main
	$desc = GUICtrlCreateInput( "Description" , 10 , $cy + 15 , 130 , 20 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )


$cy = $cy + 40


;###COLOR###

	;##INPUT##
	GUICtrlCreateLabel( "Color" , 10 , $cy , 100 , 15 )
		;Main
		$col = GUICtrlCreateInput( "0xFFFFFF" , 10 , $cy + 15 , 130 , 20 )
		;Styles
		GUICtrlSetStyle ( -1 , 0x00001000 , 0x00000020 )

	;##DISPLAY##
		;#FRAME#
			;Label
			$lcframe = GUICtrlCreateLabel( "" , 149 , $cy + 14 , 42 , 21 )
			;Stroke
			GUICtrlSetBkColor( $lcframe , 0x000000 )
		;#FILL#
			;Label
			$lcol = GUICtrlCreateLabel( "" , 150 , $cy + 15 , 40 , 19 )
			;Fill
			GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

	;##SLIDERS##
		;#SLIDER_R#
			;Main
			$slr = GUICtrlCreateSlider( 200 , $cy - 27 , 255 , 30 )
			;Styles
			GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )
			GUICtrlSetBkColor ( -1 , 0xD0D0D0 )
			;Default
			GUICtrlSetData ( $slr , 100 )
			;Display
			$rv = GUICtrlCreateLabel( "Red: 255" , 455 , $cy - 27 , 50 , 15 )
		;#SLIDER_G#
			;Main
			$slg = GUICtrlCreateSlider( 200 , $cy + 13 , 255 , 30 )
			;Styles
			GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )
			GUICtrlSetBkColor ( -1 , 0xD0D0D0 )
			;Default
			GUICtrlSetData ( $slg , 100 )
			;Display
			$gv = GUICtrlCreateLabel( "Green: 255" , 455 , $cy + 13 , 70 , 15 )
		;#SLIDER_B#
			;Main
			$slb = GUICtrlCreateSlider( 200 , $cy + 53 , 255 , 30 )
			;Styles
			GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )
			GUICtrlSetBkColor ( -1 , 0xD0D0D0 )
			;Default
			GUICtrlSetData ( $slb , 100 )
			;Display
			$bv = GUICtrlCreateLabel( "Blue: 255" , 455 , $cy + 53 , 50 , 15 )


$cy = $cy + 40


;###MENUSECTION###
GUICtrlCreateLabel( "MenuSection" , 10 , $cy , 100 , 15 )
	;Main
	$menu = GUICtrlCreateCombo( "0: Walls" , 10 , $cy + 15 , 130 , 20 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )
	;Data
	GUICtrlSetData ( -1 , "1: Electric|2: Powered|3: Sensors|4: Force-creating|5: Explosives|6: Gases|7: Liquids|8: Powders|9: Solids|10: Radioactive|11: Special|12: Life|13: Tools (UNRELIABLE)|14: Deco (UNRELIABLE)" )


$cy = $cy + 40


;###GRAVITY###
GUICtrlCreateLabel( "Gravity" , 10 , $cy , 100 , 15 )
	;Main
	$grav = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )


$cy = $cy + 40


;###FLAMMABILITY###
GUICtrlCreateLabel( "Flammable" , 10 , $cy , 100 , 15 )
	;Main
	$flammable = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )
	;Styles
	GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )


$cy = $cy + 40

GUICtrlCreateLabel( "Explosive" , 10 , $cy , 100 , 15 )

$expl = GUICtrlCreateCombo( "0: Never" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

GUICtrlSetData ( -1 , "1: Fire/Spark|2: Fire/Spark/Pressure" )

$cy = $cy + 40

GUICtrlCreateLabel( "Loss" , 10 , $cy , 100 , 15 )

$loss = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

$cy = $cy + 40

GUICtrlCreateLabel( "AirLoss" , 10 , $cy , 100 , 15 )

$aloss = GUICtrlCreateInput( "1" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

$cy = $cy + 40

GUICtrlCreateLabel( "AirDrag" , 10 , $cy , 100 , 15 )

$adrag = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

$cy = $cy + 40

GUICtrlCreateLabel( "Advection" , 10 , $cy , 100 , 15 )

$adv = GUICtrlCreateInput( "1" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

$cy = $cy + 40

GUICtrlCreateLabel( "Weight" , 10 , $cy , 100 , 15 )

$wght = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

$cy = $cy + 40

GUICtrlCreateLabel( "Diffusion" , 10 , $cy , 100 , 15 )

$diff = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

$cy = $cy + 40

GUICtrlCreateLabel( "FallDown" , 10 , $cy , 100 , 15 )

$fdn = GUICtrlCreateCombo( "0: Solid/Gas/Energy" , 10 , 545 , 130 , 20 )

GUICtrlSetStyle ( -1 , 0x00000000 , 0x00000020 )

GUICtrlSetData ( -1 , "1: Powder|2: Liquid" )

$file = GUICtrlCreateMenu ( "File" )
$save = GUICtrlCreateMenuItem ( "Save" , $file )
$saveas = GUICtrlCreateMenuItem ( "Save As..." , $file )

$help = GUICtrlCreateMenu ( "Help" )
$bugrep = GUICtrlCreateMenuItem ( "Report Bug" , $help )

Func lua ( $n1, $n2, $p, $d )
	Return "elements.property(elements." & $n1 & "_PT_" & $n2 & ", '" & $p & "', '" & $d & "')" & @CRLF
EndFunc

Func SaveFile ( )
	If Not $filename Then
		Local $docs = "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"

		$filename = FileSaveDialog("Save As...", $docs, "Lua Script (*.lua)", 2 , ".lua" )

	EndIf
	If Not @error Then
		$f = FileOpen ( $filename , 2 )

		FileWrite ( $f , "elements.allocate('AU3FGEN', '" & GUICtrlRead ( $name ) & "')" & @CRLF )

		FileWrite ( $f , "elements.element(elements.AU3FGEN_PT_" & GUICtrlRead ( $name ) & ", elements.element(elements.DEFAULT_PT_BCOL))" & @CRLF )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Name" , GUICtrlRead ( $name ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Description" , GUICtrlRead ( $desc ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Color" , GUICtrlRead ( $col ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "MenuSection" ,  StringReplace ( StringMid ( GUICtrlRead ( $menu ) , 1 , 2 ) , ":" , "" ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Gravity" , GUICtrlRead ( $grav ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Flammable" , GUICtrlRead ( $flammable ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Explosive" , StringMid ( GUICtrlRead ( $expl ) , 1 , 1 ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Loss" , GUICtrlRead ( $loss ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "AirLoss" , GUICtrlRead ( $aloss ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "AirDrag" , GUICtrlRead ( $adrag ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Advection" , GUICtrlRead ( $adv ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Weight" , GUICtrlRead ( $wght ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Diffusion" , GUICtrlRead ( $diff ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Diffusion" , StringMid ( GUICtrlRead ( $fdn ) , 1 , 1 ) ) )

#cs
GRELEMGraphics = function(i, r, g, b)
	local x = tpt.get_property('x', i)
	local y = tpt.get_property('y', i)
	graphics.drawLine(x - tpt.get_property('vx', i), y - tpt.get_property('vy', i), x + tpt.get_property('vx', i), y + tpt.get_property('vy', i), 255, 0, 0, 75)
	graphics.fillCircle(x, y, 2, 2, 255, 255, 255, tpt.get_property('vx', i) * tpt.get_property('vy', i))
end
tpt.graphics_func(GRELEMGraphics, tpt.element('GRELEM'))
#ce

		FileWrite ( $f , "local g = function(i, x, y, s, n)" & @CRLF & _
	GUICtrlRead( $update ) & @CRLF & _
"end " & @CRLF & "tpt.element_func(g, tpt.element('" & GUICtrlRead ( $name ) & "'))" & @CRLF )
		FileWrite ( $f , "local g = function(i, r, g, b)" & @CRLF & _
	GUICtrlRead( $graphics )& @CRLF & _
"end " & @CRLF & "tpt.graphics_func(g, tpt.element('" & GUICtrlRead ( $name ) & "'))" )

		FileClose ( $f )
	EndIf

EndFunc

Func SaveFileAs ( )

	Local $docs = "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"

	$filename = FileSaveDialog("Save As...", $docs, "Lua Script (*.lua)", 2 , ".lua" )

	If Not @error Then
		$f = FileOpen ( $filename , 2 )

		FileWrite ( $f , "elements.allocate('AU3FGEN', '" & GUICtrlRead ( $name ) & "')" & @CRLF )

		FileWrite ( $f , "elements.element(elements.AU3FGEN_PT_" & GUICtrlRead ( $name ) & ", elements.element(elements.DEFAULT_PT_BCOL))" & @CRLF )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Name" , GUICtrlRead ( $name ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Description" , GUICtrlRead ( $desc ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Color" , GUICtrlRead ( $col ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "MenuSection" ,  StringReplace ( StringMid ( GUICtrlRead ( $menu ) , 1 , 2 ) , ":" , "" ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Gravity" , GUICtrlRead ( $grav ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Flammable" , GUICtrlRead ( $flammable ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Explosive" , StringMid ( GUICtrlRead ( $expl ) , 1 , 1 ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Loss" , GUICtrlRead ( $loss ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "AirLoss" , GUICtrlRead ( $aloss ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "AirDrag" , GUICtrlRead ( $adrag ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Advection" , GUICtrlRead ( $adv ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Weight" , GUICtrlRead ( $wght ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Diffusion" , GUICtrlRead ( $diff ) ) )

		FileWrite ( $f , lua ( "AU3FGEN" , GUICtrlRead ( $name ) , "Falldown" , StringMid ( GUICtrlRead ( $fdn ) , 1 , 1 ) ) )

		FileWrite ( $f , "local g = function(i, x, y, s, n)" & @CRLF _
	& GUICtrlRead( $update ) & @CRLF & _
"end " & @CRLF & "tpt.element_func(g, tpt.element('" & GUICtrlRead ( $name ) & "'))" & @CRLF )
		FileWrite ( $f , "local g = function(i, r, g, b)" & @CRLF & _
	GUICtrlRead( $graphics )& @CRLF & _
"end " & @CRLF & "tpt.graphics_func(g, tpt.element('" & GUICtrlRead ( $name ) & "'))" )

		FileClose ( $f )
	EndIf

EndFunc

HotKeySet ( "^s" , "SaveFile" )

HotKeySet ( "^+s" , "SaveFileAs" )
HotKeySet ( "^f" , "GetGraphicsFunc" )

While 1

	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE

			Exit

		Case $col

			GUICtrlSetData ( $slr , Dec ( StringMid ( GUICtrlRead ( $col ) , 3 , 2 ) ) / 2.55 )

			GUICtrlSetData ( $slg , Dec ( StringMid ( GUICtrlRead ( $col ) , 5 , 2 ) ) / 2.55 )

			GUICtrlSetData ( $slb , Dec ( StringMid ( GUICtrlRead ( $col ) , 7 , 2 ) ) / 2.55 )

			GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

		Case $slr
			GUICtrlSetData ( $col , "0x" & _
			Hex ( round ( GUICtrlRead ( $slr ) * 2.55 ) , 2 ) & _
			Hex ( round ( GUICtrlRead ( $slg ) * 2.55 ) , 2 ) & _
			Hex ( round ( GUICtrlRead ( $slb ) * 2.55 ) , 2 ) )

			GUICtrlSetData ( $rv , "Red: " &  Round ( GUICtrlRead ( $slr ) * 2.55 ) )

			GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

		Case $slg
			GUICtrlSetData ( $col , "0x" & _
			Hex ( round ( GUICtrlRead ( $slr ) * 2.55 ) , 2 ) & _
			Hex ( round ( GUICtrlRead ( $slg ) * 2.55 ) , 2 ) & _
			Hex ( round ( GUICtrlRead ( $slb ) * 2.55 ) , 2 ) )

			GUICtrlSetData ( $gv , "Green: " &  Round ( GUICtrlRead ( $slg ) * 2.55 ) )

			GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

		Case $slb
			GUICtrlSetData ( $col , "0x" & _
			Hex ( round ( GUICtrlRead ( $slr ) * 2.55 ) , 2 ) & _
			Hex ( round ( GUICtrlRead ( $slg ) * 2.55 ) , 2 ) & _
			Hex ( round ( GUICtrlRead ( $slb ) * 2.55 ) , 2 ) )

			GUICtrlSetData ( $bv , "Blue: " & Round ( GUICtrlRead ( $slb ) * 2.55 ) )

			GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

		Case $save

			SaveFile ( )

		Case $saveas

			SaveFileAs ( )

		Case $bugrep

			BugRep ( )

	EndSwitch

	If InetGetInfo ( $file , 2 ) = True Then
		InetClose ( $file )
	EndIf

#cs - Uncomment this to use real-time updating of the color displays ( it is a bit laggy )

	GUICtrlSetData ( $col , "0x" & _
	Hex ( round ( GUICtrlRead ( $slr ) * 2.55 ) , 2 ) & _
	Hex ( round ( GUICtrlRead ( $slg ) * 2.55 ) , 2 ) & _
	Hex ( round ( GUICtrlRead ( $slb ) * 2.55 ) , 2 ) )

	GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

	GUICtrlSetData ( $rv , "Red: " &  Round ( GUICtrlRead ( $slr ) * 2.55 ) )

	GUICtrlSetData ( $gv , "Green: " &  Round ( GUICtrlRead ( $slg ) * 2.55 ) )

	GUICtrlSetData ( $bv , "Blue: " & Round ( GUICtrlRead ( $slb ) * 2.55 ) )

	Sleep ( 63 )

#ce

WEnd
