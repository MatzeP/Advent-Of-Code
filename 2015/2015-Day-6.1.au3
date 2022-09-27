#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 6: Probably a Fire Hazard ---
Because your neighbors keep defeating you in the holiday house decorating contest year after year, you've decided to deploy one million lights in a 1000x1000 grid.

Furthermore, because you've been especially nice this year, Santa has mailed you instructions on how to display the ideal lighting configuration.

Lights in your grid are numbered from 0 to 999 in each direction; the lights at each corner are at 0,0, 0,999, 999,999, and 999,0. The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs. Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2 therefore refers to 9 lights in a 3x3 square. The lights all start turned off.

To defeat your neighbors this year, all you have to do is set up your lights by doing the instructions Santa sent you in order.

For example:

turn on 0,0 through 999,999 would turn on (or leave on) every light.
toggle 0,0 through 999,0 would toggle the first line of 1000 lights, turning off the ones that were on, and turning on the ones that were off.
turn off 499,499 through 500,500 would turn off (or leave off) the middle four lights.
After following the instructions, how many lights are lit?

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
Global $LightCount=0
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
					$aLightArray[$i][$j]=Int(Not $aLightArray[$i][$j])
;~ 					ConsoleWrite("Toggle - " & $aLightArray[$i][$j] & @CRLF)
				Case "TURN ON"
					$aLightArray[$i][$j]=1
;~ 					ConsoleWrite("Turn On - " & $aLightArray[$i][$j] & @CRLF)
				Case "TURN OFF"
					$aLightArray[$i][$j]=0
;~ 					ConsoleWrite("Turn off - " & $aLightArray[$i][$j] & @CRLF)
			EndSwitch
		Next
	Next
Next

For $i=0 To 999
	For $j=0 To 999
		If $aLightArray[$i][$j]=1 Then
			$LightCount+=1
		EndIf
	Next
Next

ClipPut($LightCount)
MsgBox(0,"2015_Day-6.1",$LightCount) ;Lösung 377891
