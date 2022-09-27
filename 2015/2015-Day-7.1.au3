#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 7: Some Assembly Required ---
This year, Santa brought little Bobby Tables a set of wires and bitwise logic gates! Unfortunately, little Bobby is a little under the recommended age range, and he needs help assembling the circuit.

Each wire has an identifier (some lowercase letters) and can carry a 16-bit signal (a number from 0 to 65535). A signal is provided to each wire by a gate, another wire, or some specific value. Each wire can only get a signal from one source, but can provide its signal to multiple destinations. A gate provides no signal until all of its inputs have a signal.

The included instructions booklet describes how to connect the parts together: x AND y -> z means to connect wires x and y to an AND gate, and then connect its output to wire z.

For example:

123 -> x means that the signal 123 is provided to wire x.
x AND y -> z means that the bitwise AND of wire x and wire y is provided to wire z.
p LSHIFT 2 -> q means that the value from wire p is left-shifted by 2 and then provided to wire q.
NOT e -> f means that the bitwise complement of the value from wire e is provided to wire f.
Other possible gates include OR (bitwise OR) and RSHIFT (right-shift). If, for some reason, you'd like to emulate the circuit instead, almost all programming languages (for example, C, JavaScript, or Python) provide operators for these gates.

For example, here is a simple circuit:

123 -> x
456 -> y
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
NOT y -> i
After it is run, these are the signals on the wires:

d: 72
e: 507
f: 492
g: 114
h: 65412
i: 65079
x: 123
y: 456
In little Bobby's kit's instructions booklet (provided as your puzzle input), what signal is ultimately provided to wire a?

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
_FileReadToArray("2015-Day-7.1_Input.txt",$Input)

;~ Global $aLightArray[1000][1000]

;~ For $i=0 To 999
;~ 	For $j=0 To 999
;~ 		$aLightArray[$i][$j]=0
;~ 	Next
;~ Next

Global $InputSplit
Global $aWireArray[1][2]
Global $res=""

Do
	For $a=1 To $Input[0]
		ConsoleWrite("("&$a&") - "&$Input[$a]&@CRLF)
		If StringRegExp($Input[$a],"^(\d+)\s->\s(\w+)") = 1 Then
			$InputSplit=StringRegExp($Input[$a],"^(\d+)\s->\s(\w+)",3)
;~ 			_ArrayDisplay($InputSplit,"$InputSplit")
			$res=$InputSplit[0]&"|"&$InputSplit[1]
			_ArrayAdd($aWireArray,$res)
			$aWireArray[0][0]=UBound($aWireArray)-1
			$Input[$a]=""
;~ 			_ArrayDisplay($aWireArray)
		ElseIf StringRegExp($Input[$a],"^NOT\s(\w+)\s->\s(\w+)") = 1 Then
			$InputSplit=StringRegExp($Input[$a],"^NOT\s(\w+)\s->\s(\w+)",3)
;~ 			_ArrayDisplay($InputSplit,"NOT $InputSplit")
			$res=$InputSplit[0]&"|"&$InputSplit[1]
;~ 			MsgBox(0,"",$res)
			_ArrayAdd($aWireArray,$res)
			$aWireArray[0][0]=UBound($aWireArray)-1
			$Input[$a]=""
;~ 			_ArrayDisplay($aWireArray)
		EndIf
;~ 		ElseIf StringRegExp($Input[$a],"^(.*)\s(\w+)\s(.*)\s->\s(\w+)",3)
	;~ 		$InputSplit=StringRegExp($Input[$a],"^(\d+)\s->\s(\w+)",3)
;~ 		_ArrayDisplay($InputSplit,$a)
	Next
	_ArraySort($Input,1,1)
;~ 	_ArrayDisplay($Input)
	For $a=$Input[0] To 1 Step -1
		If $Input[$a]="" Then
		_ArrayDelete($Input,$a)
		EndIf
	Next
	$Input[0]=UBound($Input)-1
	_ArrayDisplay($Input)
	_ArrayDisplay($aWireArray)
Until $Input[0]=1
_ArrayDisplay($aWireArray)
;~ ClipPut($LightBrightness)
;~ MsgBox(0,"2015_Day-6.1",$LightBrightness) ;Lösung 14110788
