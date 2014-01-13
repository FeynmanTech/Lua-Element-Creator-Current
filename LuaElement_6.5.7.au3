#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Generic Icons\LET\Grey Tab.ico
#AutoIt3Wrapper_Outfile=Lua Element Creator_x86.exe
#AutoIt3Wrapper_Outfile_x64=Lua Element Creator.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=This is, has been, and ever will be buggy. If it doesn't work, just tell me (FeynmanLogomaker) in a PM, or on the forum thread.
#AutoIt3Wrapper_Res_Fileversion=6.5.7.0
#AutoIt3Wrapper_Res_SaveSource=y
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <GUIConstantsEx.au3>
; *** End added by AutoIt3Wrapper ***
#include <utils.au3>

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

Func GetGraphicsFunc ( )
	Static $w = 370, $h = 565

	Local $gfhguihnd = GUICreate("Graphics Function Helper", $w, $h)

	GUISetState(@SW_SHOW)

	Local Static $FontWeight = 200

	GUISetBkColor ( 0xFFFFFF )

	GUICtrlSetDefBkColor ( 0xFFFFFF )

	GUISetFont ( 8.5 , $FontWeight , 0 , "" , $gfhguihnd , 1 )

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

Local $filename

Static $_VER = "6.5.7"

Static $_DOWNLOAD_URL = "https://dl.dropboxusercontent.com/s/92w0ae9e6og98kr/Ver.%206.5.7.zip?dl=1&token_hash=AAFWQ-2pjkGSUhSVAgjJXlMCJcT7cv0U6ZHdIV4jkGKRMg"
Static $_VERSION_URL = "http://pastebin.com/raw.php?i=4VxNwZ29"
Static $_WHATSNEW_URL = "http://pastebin.com/raw.php?i=2ZR5K1XV"

Static $_CURRENT = GetUrlData ( $_VERSION_URL )

Static $_WHATSNEW = GetUrlData ( $_WHATSNEW_URL )

If $_VER <> $_CURRENT Then

	Local $Result = prompt_YesNo ( "Software is out of date!" & @CRLF & "Your version: " & $_VER & @CRLF & "Current version: " & $_CURRENT & @CRLF & @CRLF & "What's New: " & $_WHATSNEW & @CRLF & @CRLF & "Download update?" , "Update available" )

	if $result = 6 Then

		$file = InetGet ( $_DOWNLOAD_URL , "Ver. " & $_CURRENT & "_Updated.zip" , 16 , 1 )

	EndIf
EndIf

Static $_W = 1275

Static $_H = 615

Static $FontWeight = 200

DirCreate( "Lua Elements" )

$guihnd = GUICreate("Lua Element Tool", $_W, $_H)

GUISetState(@SW_SHOW)

GUISetBkColor ( 0xFFFFFF )

GUICtrlSetDefBkColor ( 0xFFFFFF )

GUISetFont ( 8.5 , $FontWeight , 0 , "" , $guihnd , 1 )

$cy = 10

GUICtrlCreateLabel( "Name" , 10 , $cy , 100 , 15 )

GUICtrlCreateLabel ( "Lua Element Tool Version " & $_VER , 145 , 19 , 350 , 30 )
GUICtrlSetFont ( -1 , 15 , 200 , 0 , "Segoe UI" , 1 )

If $_VER <> $_CURRENT Then
	GUICtrlCreateLabel ( "Current Version: " & $_CURRENT , 145 , 49 , 350 , 30 )
EndIf

GUICtrlCreateLabel ( "Update Function" , 525 , 10 )

$update = GUICtrlCreateEdit( "--Update Function" , 525 , 30 , 355 , $_H - 55 )

GUICtrlSetFont ( $update , 10 , 200 , 0 , "Consolas" , 1 )

GUICtrlSetColor ( $update , 0xFFFFFF )

GUICtrlSetBkColor ( $update , 0x000000 )

#cs

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

#ce

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

GUICtrlCreateLabel ( "Graphics Fuction (Press Ctrl-F to run the Graphics Function Helper)" , 900 , 10 )

$graphics = GUICtrlCreateEdit( $GraphicsFuncDef , 900 , 30 , 355 , $_H - 55 )

GUICtrlSetFont ( $graphics , 10 , 200 , 0 , "Consolas" , 1 )

GUICtrlSetColor ( $graphics , 0xFFFFFF )

GUICtrlSetBkColor ( $graphics , 0x000000 )

$name = GUICtrlCreateInput( "ELEM" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Description" , 10 , $cy , 100 , 15 )

$desc = GUICtrlCreateInput( "Description" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Color" , 10 , $cy , 100 , 15 )

$col = GUICtrlCreateInput( "0xFFFFFF" , 10 , $cy + 15 , 130 , 20 )

$lcframe = GUICtrlCreateLabel( "" , 149 , $cy + 14 , 42 , 21 )

GUICtrlSetBkColor( $lcframe , 0x000000 )

$lcol = GUICtrlCreateLabel( "" , 150 , $cy + 15 , 40 , 19 )

GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

$slr = GUICtrlCreateSlider( 200 , $cy - 27 , 255 , 30 )

GUICtrlSetData ( $slr , 100 )

$rv = GUICtrlCreateLabel( "Red: 255" , 455 , $cy - 27 , 50 , 15 )

$slg = GUICtrlCreateSlider( 200 , $cy + 13 , 255 , 30 )

GUICtrlSetData ( $slg , 100 )

$gv = GUICtrlCreateLabel( "Green: 255" , 455 , $cy + 13 , 70 , 15 )

$slb = GUICtrlCreateSlider( 200 , $cy + 53 , 255 , 30 )

GUICtrlSetData ( $slb , 100 )

$bv = GUICtrlCreateLabel( "Blue: 255" , 455 , $cy + 53 , 50 , 15 )

$cy = $cy + 40

GUICtrlCreateLabel( "MenuSection" , 10 , $cy , 100 , 15 )

$menu = GUICtrlCreateCombo( "0: Walls" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetData ( -1 , "1: Electric|2: Powered|3: Sensors|4: Force-creating|5: Explosives|6: Gases|7: Liquids|8: Powders|9: Solids|10: Radioactive|11: Special|12: Life|13: Tools (UNRELIABLE)|14: Deco (UNRELIABLE)" )

$cy = $cy + 40

GUICtrlCreateLabel( "Gravity" , 10 , $cy , 100 , 15 )

$grav = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Flammable" , 10 , $cy , 100 , 15 )

$flammable = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Explosive" , 10 , $cy , 100 , 15 )

$expl = GUICtrlCreateCombo( "0: Never" , 10 , $cy + 15 , 130 , 20 )

GUICtrlSetData ( -1 , "1: Fire/Spark|2: Fire/Spark/Pressure" )

$cy = $cy + 40

GUICtrlCreateLabel( "Loss" , 10 , $cy , 100 , 15 )

$loss = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "AirLoss" , 10 , $cy , 100 , 15 )

$aloss = GUICtrlCreateInput( "1" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "AirDrag" , 10 , $cy , 100 , 15 )

$adrag = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Advection" , 10 , $cy , 100 , 15 )

$adv = GUICtrlCreateInput( "1" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Weight" , 10 , $cy , 100 , 15 )

$wght = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "Diffusion" , 10 , $cy , 100 , 15 )

$diff = GUICtrlCreateInput( "0" , 10 , $cy + 15 , 130 , 20 )

$cy = $cy + 40

GUICtrlCreateLabel( "FallDown" , 10 , $cy , 100 , 15 )

$fdn = GUICtrlCreateCombo( "0: Solid/Gas/Energy" , 10 , 545 , 130 , 20 )

GUICtrlSetData ( -1 , "1: Powder|2: Liquid" )

$file = GUICtrlCreateMenu ( "File" )

$save = GUICtrlCreateMenuItem ( "Save" , $file )

$saveas = GUICtrlCreateMenuItem ( "Save As..." , $file )

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
