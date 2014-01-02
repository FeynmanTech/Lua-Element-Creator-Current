#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=favicon (3).ico
#AutoIt3Wrapper_Outfile=Lua Element Creator_x86.exe
#AutoIt3Wrapper_Outfile_x64=Lua Element Creator.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Res_Comment=This is, has been, and ever will be buggy. If it doesn't work, just tell me (FeynmanLogomaker) in a PM, or on the forum thread.
#AutoIt3Wrapper_Res_Description=A program designed to create Lua scripts that will create an element in The Powder Toy
#AutoIt3Wrapper_Res_Fileversion=2.1.1
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <GUIConstantsEx.au3>
; *** End added by AutoIt3Wrapper ***
#include <utils.au3>


Local $filename

Static $_VER = "4.7.3"

Static $FontWeight = 200

DirCreate( "Lua Elements" )

$guihnd = GUICreate("Lua Element Tool", 1275, 615)

GUISetState(@SW_SHOW)

GUISetBkColor ( 0xFFFFFF )

GUICtrlSetDefBkColor ( 0xFFFFFF )

GUISetFont ( 8.5 , $FontWeight , 0 , "" , $guihnd , 1 )

$cy = 10

GUICtrlCreateLabel( "Name" , 10 , $cy , 100 , 15 )

GUICtrlCreateLabel ( "Lua Element Tool Version " & $_VER , 145 , 19 , 350 , 30 )

GUICtrlSetFont ( -1 , 15 , 200 , 0 , "Segoe UI" , 1 )

$update = GUICtrlCreateEdit( "--Update Function" , 525 , 20 , 355 , 560 )

GUICtrlSetFont ( $update , 10 , 200 , 0 , "Consolas" , 1 )

$graphics = GUICtrlCreateEdit( "--Graphics Function" , 900 , 20 , 355 , 560 )

GUICtrlSetFont ( $graphics , 10 , 200 , 0 , "Consolas" , 1 )

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

#cs - Comment out this to use real-time updating of the color displays ( it is a bit laggy )

	GUICtrlSetBkColor( $lcol , GUICtrlRead( $col ) )

	GUICtrlSetData ( $rv , "Red: " &  Round ( GUICtrlRead ( $slr ) * 2.55 ) )

	GUICtrlSetData ( $gv , "Green: " &  Round ( GUICtrlRead ( $slg ) * 2.55 ) )

	GUICtrlSetData ( $bv , "Blue: " & Round ( GUICtrlRead ( $slb ) * 2.55 ) )

	Sleep ( 75 )

#ce

WEnd
