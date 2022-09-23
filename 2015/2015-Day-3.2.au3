#cs ----------------------------------------------------------------------------

--- Part Two ---
The next year, to speed up the process, Santa creates a robot version of himself, Robo-Santa, to deliver presents with him.

Santa and Robo-Santa start at the same location (delivering two presents to the same starting house), then take turns moving based on instructions from the elf, who is eggnoggedly reading from the same script as the previous year.

This year, how many houses receive at least one present?

For example:

^v delivers presents to 3 houses, because Santa goes north, and then Robo-Santa goes south.
^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end up back where they started.
^v^v^v^v^v now delivers presents to 11 houses, with Santa going one direction and Robo-Santa going the other.

#ce ----------------------------------------------------------------------------

#include <array.au3>

Global $Input=FileRead("2015-Day-3.2_Input.txt")
Global $Data=StringSplit($Input,"")

Global $aDimension[501][501]
Global $xPosSanta=200
Global $yPosSanta=200
Global $xPosRoboSanta=200
Global $yPosRoboSanta=200
Global $Santa, $RoboSanta
Global $HouseCount=0

For $i=0 To 500
	For $j=0 To 500
		$aDimension[$i][$j] = 0
	Next
Next

For $i=1 To $Data[0] Step 2
	$Santa=$Data[$i]
	$RoboSanta=$Data[$i+1]

	Switch $Santa
		Case "^"
			$yPosSanta+=1
		Case "v"
			$yPosSanta-=1
		Case ">"
			$xPosSanta+=1
		Case "<"
			$xPosSanta-=1
	EndSwitch

	If $aDimension[$yPosSanta][$xPosSanta] = 0 Then
		$aDimension[$yPosSanta][$xPosSanta] = 1
	Else
		$aDimension[$yPosSanta][$xPosSanta] = $aDimension[$yPosSanta][$xPosSanta] + 1
	EndIf

	Switch $RoboSanta
		Case "^"
			$yPosRoboSanta+=1
		Case "v"
			$yPosRoboSanta-=1
		Case ">"
			$xPosRoboSanta+=1
		Case "<"
			$xPosRoboSanta-=1
	EndSwitch

	If $aDimension[$yPosRoboSanta][$xPosRoboSanta] = 0 Then
		$aDimension[$yPosRoboSanta][$xPosRoboSanta] = 1
	Else
		$aDimension[$yPosRoboSanta][$xPosRoboSanta] = $aDimension[$yPosRoboSanta][$xPosRoboSanta] + 1
	EndIf

Next

For $i=0 To 500
	For $j=0 To 500
		If $aDimension[$i][$j] >= 1 Then
			$HouseCount+=1
		EndIf
	Next
Next

MsgBox(0,"2015_Day-3.2",$HouseCount) ;Lösung 2639
;_ArrayDisplay($aDimension)