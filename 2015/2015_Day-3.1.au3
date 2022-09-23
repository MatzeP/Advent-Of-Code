#cs ----------------------------------------------------------------------------
--- Day 3: Perfectly Spherical Houses in a Vacuum ---
Santa is delivering presents to an infinite two-dimensional grid of houses.

He begins by delivering a present to the house at his starting location, and then an elf at the North Pole calls him via radio and tells him where to move next. Moves are always exactly one house to the north (^), south (v), east (>), or west (<). After each move, he delivers another present to the house at his new location.

However, the elf back at the north pole has had a little too much eggnog, and so his directions are a little off, and Santa ends up visiting some houses more than once. How many houses receive at least one present?

For example:

> delivers presents to 2 houses: one at the starting location, and one to the east.
^>v< delivers presents to 4 houses in a square, including twice to the house at his starting/ending location.
^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses.

#ce ----------------------------------------------------------------------------

#include <File.au3>
#include <Array.au3>

Global $InputData=FileRead("2015_Day-3.1_Input.txt")
;~ _FileReadToArray("2015_Day-3.1_Bsp.txt",$Input)
;~ MsgBox(0,"",$Input)
Global $Input=StringSplit($InputData,"")

Global $aDimension[501][501]
Global $xPos=100
Global $yPos=100
Global $String, $data
Global $Count=0

For $i=0 to 500
	For $j=0 to 500
		$aDimension[$i][$j]=0
	Next
Next

;~ _ArrayDisplay($aDimension)
;~ Exit
For $i=1 to $Input[0]
	$String=$Input[$i]
;~ 	MsgBox(0,"String",$String,1)
	Switch $String
		Case "^"
			$xPos+=1
		Case "v"
			$xPos-=1
		Case "<"
			$yPos-=1
		Case ">"
			$yPos+=1
	EndSwitch
;~ 	$data=$data & $xPos&"/"&$yPos&@CRLF
;~ 	 ConsoleWrite("\$xPos: "&$xPos&", \$yPos: "&$yPos&@CRLF)
	Local $value=$aDimension[Number($xPos)][Number($yPos)]
	If $value = "0" Then
		$aDimension[$xPos][$yPos] = 1
	Else
		$aDimension[$xPos][$yPos] = $aDimension[$xPos][$yPos] + 1
	EndIf
Next

For $i=0 to 500
	For $j=0 to 500
		If	$aDimension[$i][$j] >= 1 Then
			$Count+=1
		EndIf
	Next
Next
;~ _ArrayDisplay($aDimension)
MsgBox(0,"mind. 1 Geschenk",$Count) ; Lösung 2565

