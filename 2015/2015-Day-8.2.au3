#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 8: Matchsticks ---
--- Part Two ---
Now, let's go the other way. In addition to finding the number of characters of code, you should now encode each code representation as a new string and find the number of characters of the new encoded representation, including the surrounding double quotes.

For example:

"" encodes to "\"\"", an increase from 2 characters to 6.
"abc" encodes to "\"abc\"", an increase from 5 characters to 9.
"aaa\"aaa" encodes to "\"aaa\\\"aaa\"", an increase from 10 characters to 16.
"\x27" encodes to "\"\\x27\"", an increase from 6 characters to 11.
Your task is to find the total number of characters to represent the newly encoded strings minus the number of characters of code in each original string literal. For example, for the strings above, the total encoded length (6 + 9 + 16 + 11 = 42) minus the characters in the original code representation (23, just like in the first part of this puzzle) is 42 - 23 = 19.

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
_FileReadToArray("2015-Day-8.1_Input.txt",$Input)
;~ _FileReadToArray("test.txt",$Input)
_ArrayDisplay($Input)
Global $lastLength=0
Global $MaxStringLength=0
Global $ClearStringLength=0
Global $Loesung=0
Global $newString

Global $tempString=0

;~ _ArrayDisplay($Input)

For $i=1 To $Input[0]

	$MaxStringLength=$MaxStringLength+StringLen($Input[$i])
	$tempString=StringLen($Input[$i])
	$ClearStringLength=$Input[$i]
	ConsoleWrite(" ~~~~~~~~~~~~~ " & @CRLF)
	ConsoleWrite("0 - " & $Input[$i] & " -- " & StringLen($Input[$i]) & @CRLF)

	$ClearStringLength=StringReplace($ClearStringLength,"\","\\")
	ConsoleWrite("1 - " & $ClearStringLength & @CRLF)
;~ 		$ClearStringLength=StringRegExpReplace($ClearStringLength,'^"(.*)"$','\\"$1\\"')
;~ 		$tempString=$tempString-2
$ClearStringLength=StringReplace($ClearStringLength,'"','\"')
		ConsoleWrite("2 - " & $ClearStringLength & @CRLF)

	#cs
	$tempReq=StringRegExp($ClearStringLength,'\\\\',3)
	For $j=0 To UBound($tempReq)-1
		$ClearStringLength=StringRegExpReplace($ClearStringLength,'\\\\',"@")
		$tempString=$tempString-1
;~ 		ConsoleWrite("2 - " & StringLen($Input[$i])-1 & @CRLF)
	Next

	$tempReq=StringRegExp($ClearStringLength,'\\"',3)
;~ 	_ArrayDisplay($tempReq)
	For $j=0 To UBound($tempReq)-1
		$ClearStringLength=StringRegExpReplace($ClearStringLength,'\\"',"'")
		$tempString=$tempString-1
;~ 		ConsoleWrite("4 - " & StringLen($Input[$i])-2 & @CRLF)
	Next

	$tempReq=StringRegExp($ClearStringLength,'\\x[a-fA-F0-9][a-fA-F0-9]',3);"\\x\d{2}",3)
	For $j=0 To UBound($tempReq)-1
		$ClearStringLength=StringRegExpReplace($ClearStringLength,'\\x[a-fA-F0-9][a-fA-F0-9]',"#");"\\x\d{2}","#")
		$tempString=$tempString-3
;~ 		ConsoleWrite("3 - " & StringLen($Input[$i])-3 & @CRLF)9
	Next
	#ce

$ClearStringLength='"'&$ClearStringLength&'"'

ConsoleWrite("9 - " & $ClearStringLength & " -- " & StringLen($ClearStringLength) & @CRLF)
;~ ConsoleWrite("G - " & $tempString & @CRLF)
;~ ConsoleWrite("MaX - " & $MaxStringLength & " --- " & StringLen($ClearStringLength) & @CRLF)
$Loesung=$Loesung+StringLen($ClearStringLength)
Next


;~ _ArrayDisplay($Input)

MsgBox(0,"2015_Day-8.2"," $MaxStringLength " & $MaxStringLength & "  Lösung " & $Loesung & " ("&$Loesung-$MaxStringLength) ;Lösung 2046 !!!!!!
;~ ;FALSCH:
ClipPut($MaxStringLength - $Loesung)