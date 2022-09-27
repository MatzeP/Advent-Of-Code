#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Part Two ---
You just finish implementing your winning light pattern when you realize you mistranslated Santa's message from Ancient Nordic Elvish.

The light grid you bought actually has individual brightness controls; each light can have a brightness of zero or more. The lights all start at zero.

The phrase turn on actually means that you should increase the brightness of those lights by 1.

The phrase turn off actually means that you should decrease the brightness of those lights by 1, to a minimum of zero.

The phrase toggle actually means that you should increase the brightness of those lights by 2.

What is the total brightness of all lights combined after following Santa's instructions?

For example:

turn on 0,0 through 0,0 would increase the total brightness by 1.
toggle 0,0 through 999,999 would increase the total brightness by 2000000.

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
_FileReadToArray("2015-Day-6.1_Input.txt",$Input)

Global $aLightArray[1000][1000]

For $i=0 To 999
	For $j=0 To 999
		$aLightArray[$i][$j]=0
	Next
Next

Global $InputSplit
Global $LightBrightness=0
Global $lightSwitch,$Start, $StartX, $StartY, $End, $EndX, $EndY

;~ MsgBox(0,"2015_Day-6.1","Start")
For $a=1 To $Input[0]
	$InputSplit=StringRegExp($Input[$a],"(.*)\s(\d{1,3},\d{1,3})\sthrough\s(\d{1,3},\d{1,3})",3)
	$lightSwitch=$InputSplit[0]
	$Start=StringSplit($InputSplit[1],",")
		$StartX=$Start[1]
		$StartY=$Start[2]
	$End=StringSplit($InputSplit[2],",")
		$EndX=$End[1]
		$EndY=$End[2]
;~ _ArrayDisplay($Start)
;~ _ArrayDisplay($End)
	For $i=$StartX To $EndX
		For $j=$StartY To $EndY
;~ 			ConsoleWrite("Coord > " & $a & " < $aLightArray["&$i&"]["&$j&"]="& $aLightArray[$i][$j] & @CRLF)
			Switch StringUpper($lightSwitch)
				Case "TOGGLE"
					$aLightArray[$i][$j] = $aLightArray[$i][$j] + 2
;~ 					ConsoleWrite("Toggle - " & $aLightArray[$i][$j] & @CRLF)
				Case "TURN ON"
					$aLightArray[$i][$j] = $aLightArray[$i][$j] + 1
;~ 					ConsoleWrite("Turn On - " & $aLightArray[$i][$j] & @CRLF)
				Case "TURN OFF"
					If $aLightArray[$i][$j] >= 1 Then
						$aLightArray[$i][$j] = $aLightArray[$i][$j] -1
					EndIf
;~ 					ConsoleWrite("Turn off - " & $aLightArray[$i][$j] & @CRLF)
			EndSwitch
		Next
	Next
Next

For $i=0 To 999
	For $j=0 To 999
		If $aLightArray[$i][$j] >= 1 Then
			$LightBrightness=$LightBrightness+$aLightArray[$i][$j]
		EndIf
	Next
Next

ClipPut($LightBrightness)
MsgBox(0,"2015_Day-6.1",$LightBrightness) ;Lösung 14110788
