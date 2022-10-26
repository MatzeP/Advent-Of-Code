#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 9: All in a Single Night ---
Every year, Santa manages to deliver all of his presents in a single night.

This year, however, he has some new locations to visit; his elves have provided him the distances between every pair of locations. He can start and end at any two (different) locations he wants, but he must visit each location exactly once. What is the shortest distance he can travel to achieve this?

For example, given the following distances:

London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141
The possible routes are therefore:

Dublin -> London -> Belfast = 982
London -> Dublin -> Belfast = 605
London -> Belfast -> Dublin = 659
Dublin -> Belfast -> London = 659
Belfast -> Dublin -> London = 605
Belfast -> London -> Dublin = 982
The shortest of these is London -> Dublin -> Belfast = 605, and so the answer is 605 in this example.

What is the distance of the shortest route?

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input, $inputDataArray, $Cities[1]
_FileReadToArray("2015-Day-9.1_Input_Bsp.txt",$Input)

For $i=1 To $Input[0]
	$inputDataArray=StringRegExp($Input[$i],'(\w*)\sto\s(\w*)\s=\s(\d*)',3)
	_ArrayDisplay($inputDataArray)
	For $j=0 to 1
		$res=_ArrayFindAll($Cities,$inputDataArray[$j])
		If @error <> 0 Then
			_ArrayAdd($Cities,$inputDataArray[$j],1)
			$Cities[0]=UBound($Cities)-1
		EndIf
	Next
Next
_ArrayDisplay($Cities)

;~ _ArrayDisplay($Input)

For $i=1 To $Input[0]

Next


;~ _ArrayDisplay($Input)

MsgBox(0,"2015_Day-9.1"," ") ;Lösung
;~ ;FALSCH:
ClipPut("")