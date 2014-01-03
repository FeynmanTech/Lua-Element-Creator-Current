; *** Start added by AutoIt3Wrapper ***
#include <GUIConstantsEx.au3>
; *** End added by AutoIt3Wrapper ***
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon (6).ico
#AutoIt3Wrapper_Outfile=Graphics Function Helper_x86.exe
#AutoIt3Wrapper_Outfile_x64=Graphics Function Helper.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <utils.au3>

Static $w = 370, $h = 565

$guihnd = GUICreate("Graphics Function Helper", $w, $h)

GUISetState(@SW_SHOW)

Static $FontWeight = 200

GUISetBkColor ( 0xFFFFFF )

GUICtrlSetDefBkColor ( 0xFFFFFF )

GUISetFont ( 8.5 , $FontWeight , 0 , "" , $guihnd , 1 )

#comments-start

Return Values: cache, pixel_mode, cola, colr, colg, colb, firea, firer, fireg, fireb

Pixel Mode Values:

PMODE_NONE		0x00000000 		--prevents anything from being drawn
PMODE_FLAT		0x00000001 		--draw a basic pixel, overwriting the color under it. Doesn't support cola.
PMODE_BLOB		0x00000002 		--adds a blobby effect, like you were using blob (5) display mode
PMODE_BLUR		0x00000004 		--used in liquids in fancy display mode
PMODE_GLOW		0x00000008 		--Glow effect, used in elements like DEUT and TRON in fancy display mode
PMODE_SPARK		0x00000010 		-- used for things such as GBMB at first, dimmer than other modes
PMODE_FLARE		0x00000020 		--BOMB and other similar elements, brighter than PMODE_SPARK
PMODE_LFLARE	0x00000040 		--brightest spark mode, used when DEST hits something
PMODE_ADD		0x00000080 		--like PMODE_FLAT, but adds color to a pixel, instead of overwriting it.
PMODE_BLEND		0x00000100 		--basically the same thing as PMODE_ADD, but has better OpenGL support
PSPEC_STICKMAN	0x00000200 		--does nothing, because the stickmen won't get drawn unless it actually is one

NO_DECO			0x00001000		--prevents decoration from showing on the element (used in LCRY)
DECO_FIRE		0x00002000 		--Allow decoration to be drawn on using the fire effect (gasses have this set)

FIRE_ADD		0x00010000 		--adds a weak fire effect around the element (ex. LAVA/LIGH)
FIRE_BLEND		0x00020000 		--adds a stronger fire effect around the element, default for gasses

EFFECT_GRAVIN	0x01000000 		--adds a PRTI effect. Might take some coding in an update function to get it to work properly, PRTI uses life and ctype to create the effects
EFFECT_GRAVOUT	0x02000000 		--adds a PRTO effect. Might take some coding in an update function to get it to work properly, PRTI uses life and ctype to create the effects

#comments-end

Local $CodeWin = False

$cy = 10

$flat = GUICtrlCreateCheckbox ( "Flat - Draw a basic pixel" , 10 , $cy )
$cy = $cy + 20
$blob = GUICtrlCreateCheckbox ( "Blob - Draws as if you were in Blob (5) Display" , 10 , $cy )
$cy = $cy + 20
$blur = GUICtrlCreateCheckbox ( "Blur - Used for liquids in Fancy (7) Display" , 10 , $cy )
$cy = $cy + 20
$glow = GUICtrlCreateCheckbox ( "Glow - Used for elements like DEUT in Fancy (7) Display" , 10 , $cy )
$cy = $cy + 20
$spark = GUICtrlCreateCheckbox ( "Spark - Used for elements like GBMB" , 10 , $cy )
$cy = $cy + 20
$flare = GUICtrlCreateCheckbox ( "Flare - Used for elements like BOMB" , 10 , $cy )
$cy = $cy + 20
$lflare = GUICtrlCreateCheckbox ( "Lflare - Used when DEST hits something" , 10 , $cy )
$cy = $cy + 20
$fireadd = GUICtrlCreateCheckbox ( "Fire_Add - Draws like LAVA/LIGH" , 10 , $cy )
$cy = $cy + 20
$fireblend = GUICtrlCreateCheckbox ( "Fire_Blend - Default for most gasses" , 10 , $cy )
$cy = $cy + 45

$sliderA = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderA , 100 )
$lblR = GUICtrlCreateLabel ( "Alpha: " & Round ( GUICtrlRead ( $sliderA ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 30

$sliderR = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderR , 100 )
$lblR = GUICtrlCreateLabel ( "Red: " & Round ( GUICtrlRead ( $sliderR ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 30

$sliderG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderG , 100 )
$lblG = GUICtrlCreateLabel ( "Green: " & Round ( GUICtrlRead ( $sliderG ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 30

$sliderB = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderB , 100 )
$lblB = GUICtrlCreateLabel ( "Blue: " & Round ( GUICtrlRead ( $sliderB ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 45

$sliderAG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderAG , 100 )
$lblR = GUICtrlCreateLabel ( "Alpha Glow: " & Round ( GUICtrlRead ( $sliderAG ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 30

$sliderRG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderRG , 100 )
$lblR = GUICtrlCreateLabel ( "Red Glow: " & Round ( GUICtrlRead ( $sliderRG ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 30

$sliderGG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderGG , 100 )
$lblG = GUICtrlCreateLabel ( "Green Glow: " & Round ( GUICtrlRead ( $sliderGG ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 30

$sliderBG = GUICtrlCreateSlider ( 10 , $cy , 255 , 30 , 0x0010 )
GUICtrlSetData ( $sliderBG , 100 )
$lblB = GUICtrlCreateLabel ( "Blue Glow: " & Round ( GUICtrlRead ( $sliderBG ) * 2.55 ) , 265 , $cy + 2 )
$cy = $cy + 45

$prev = GUICtrlCreateButton ( "Preview Code" , 10 , $cy , 200 , 30 )

GUICtrlSetStyle ( -1 , 0x8000 )

$cy = $cy + 40

$copy = GUICtrlCreateButton ( "Copy code to clipboard" , 10 , $cy , 200 , 30 )

GUICtrlSetStyle ( -1 , 0x8000 )

Func GetPmode ( )
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
	& @TAB & "return 0x" & Hex ( $r , 8 ) _
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

While 1

	$msg = GUIGetMsg( 1 )
	Select

		Case $msg[0] = $GUI_EVENT_CLOSE
			If $msg[1] = $guihnd Then
				Exit
			ElseIf $msg[1] = $CodeWin Then
				GuiDelete ( $CodeWin )
			EndIf

		Case $msg[0] = $prev

			$CodeWin = GUICreate ( "Code:" , 400 , 61 , -1 , -1 , -1 , -1 , $guihnd )
			GUISetState ( @SW_SHOW )

			GUICtrlCreateLabel ( GetPmode ( ) , 5 , 5 , 490 , 55 )
			GUICtrlSetFont ( -1 , 8.5 , 200 , -1 , "Consolas" )
			GuiSetBkColor ( 0x000000 , $CodeWin )
			GuiCtrlSetColor ( -1 , 0xFFFFFF )

		Case $msg[0] = $copy
			ClipPut ( GetPmode ( ) )

	EndSelect

WEnd
