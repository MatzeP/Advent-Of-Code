#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 10: Elves Look, Elves Say ---
Today, the Elves are playing a game called look-and-say. They take turns making sequences by reading aloud the previous sequence and using that reading as the next sequence. For example, 211 is read as "one two, two ones", which becomes 1221 (1 2, 2 1s).

Look-and-say sequences are generated iteratively, using the previous value as input for the next step. For each step, take the previous value, and replace each run of digits (like 111) with the number of digits (3) followed by the digit itself (1).

For example:

1 becomes 11 (1 copy of digit 1).
11 becomes 21 (2 copies of digit 1).
21 becomes 1211 (one 2 followed by one 1).
1211 becomes 111221 (one 1, one 2, and two 1s).
111221 becomes 312211 (three 1s, two 2s, and one 1).
Starting with the digits in your puzzle input, apply this process 40 times. What is the length of the result?

Your puzzle input is 1113222113.

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
$Input="1113222113"
Global $InputSplit=""
Global $Previous=""
Global $result=""
Global $Count=""

For $a=1 To 40
	$InputSplit=StringSplit($Input,"")
	$Previous=""
	$Count=""
	$result=""
;~ 	ConsoleWrite("0 - $InputSplit[$i]: " & $InputSplit[0] & @CRLF)
	For $i=1 To $InputSplit[0]
;~ 		ConsoleWrite("1 - Input: " & $Input & " Count: " & $Count & " Result: " & $result & @CRLF)
		If (Number($InputSplit[$i])==Number($Previous)) Then
			$Count+=1
;~ 			ConsoleWrite("2 - Input: " & $Input & " Count: " & $Count & " Result: " & $result & @CRLF)
		Else
;~ 			If $Count="" Then

;~ 			Else
				$result=$result&$Count&$Previous
				$Count=1
				$Previous=$InputSplit[$i]
;~ 			EndIf
;~ 			ConsoleWrite("3- Input: " & $Input & " Count: " & $Count & " Result: " & $result & @CRLF)
		EndIf
	Next
	$result=$result&$Count&$Previous

;~ 	zConsoleWrite("4 ( " & $a & " )- Input: " & $Input & "Count: " & $Count & "Result: " & $result & @CRLF)
ConsoleWrite("( " & $a & " )- Result: " & $result & @CRLF)
	$Input=$result

Next

MsgBox(0,"2015_Day-10.1","Input:  & $Input & @CRLF  Result: (" & StringLen($result)&") ") ;Lösung
;~ ;FALSCH: 3113322113
ClipPut(StringLen($result))