#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 8: Matchsticks ---
Space on the sleigh is limited this year, and so Santa will be bringing his list as a digital copy. He needs to know how much space it will take up when stored.

It is common in many programming languages to provide a way to escape special characters in strings. For example, C, JavaScript, Perl, Python, and even PHP handle special characters in very similar ways.

However, it is important to realize the difference between the number of characters in the code representation of the string literal and the number of characters in the in-memory string itself.

For example:

"" is 2 characters of code (the two double quotes), but the string contains zero characters.
"abc" is 5 characters of code, but 3 characters in the string data.
"aaa\"aaa" is 10 characters of code, but the string itself contains six "a" characters and a single, escaped quote character, for a total of 7 characters in the string data.
"\x27" is 6 characters of code, but the string itself contains just one - an apostrophe ('), escaped using hexadecimal notation.
Santa's list is a file that contains many double-quoted string literals, one on each line. The only escape sequences used are \\ (which represents a single backslash), \" (which represents a lone double-quote character), and \x plus two hexadecimal characters (which represents a single character with that ASCII code).

Disregarding the whitespace in the file, what is the number of characters of code for string literals minus the number of characters in memory for the values of the strings in total for the entire file?

For example, given the four strings above, the total number of characters of string code (2 + 5 + 10 + 6 = 23) minus the total number of characters in memory for string values (0 + 3 + 7 + 1 = 11) is 23 - 11 = 12.

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
	#cs
		$MaxStringLength=$MaxStringLength+StringLen($Input[$i])
ConsoleWrite("("&StringLen($Input[$i])&"/"&$MaxStringLength & ") --> " &$Input[$i] & @CRLF)
		$newString=StringTrimLeft($Input[$i],1);StringRegExp($Input[$i],'^"(.*)"$',3);,"")
		$newString=StringTrimRight($newString,1)
ConsoleWrite("Anführungszeichen entfernt --> " & $newString & @CRLF)
		$newString=StringReplace($newString,'\"','"')
ConsoleWrite('\" entfernt --> ' &$newString & @CRLF)
		If StringRegExp($newString,"\\x(\d{2})")=1 Then
			Local $ASCII=StringRegExp($newString,"\\x(\d{2})",3)
;~ 			_ArrayDisplay($ASCII,UBound($ASCII))
			For $g=0 to UBound($ASCII)-1
				$newString=StringReplace($newString,'\x'&$ASCII[$g],Chr(Number($ASCII[$g])))
			Next
;~ 			MsgBox(0,"",$newString)
;~ 			_ArrayDisplay($ASCII)
ConsoleWrite("ASCII ersetzt --> " &$newString & @CRLF)
		EndIf
		$Input[$i]=StringReplace($newString,"\\","\")
ConsoleWrite('\\ ersetzt --> ' &$Input[$i] & @CRLF)
		$ClearStringLength=$ClearStringLength+StringLen($Input[$i]);StringLen(StringStripWS($Input[$i],8)) ????? mit Leezeichen 1111 ohne 1117 ?????
#ce
	$MaxStringLength=$MaxStringLength+StringLen($Input[$i])
	$tempString=StringLen($Input[$i])
	$ClearStringLength=$Input[$i]
	ConsoleWrite(" ~~~~~~~~~~~~~ " & @CRLF)
	ConsoleWrite("0 - " & $Input[$i] & " -- " & StringLen($Input[$i]) & @CRLF)

	If StringRegExp($ClearStringLength,'^"(.*)"$')=1 Then
		$ClearStringLength=StringRegExpReplace($ClearStringLength,'^"(.*)"$',"$1")
		$tempString=$tempString-2
;~ 		ConsoleWrite("1 - " & StringLen($Input[$i])-2 & $ClearStringLength & @CRLF)
	EndIf
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

ConsoleWrite("9 - " & $ClearStringLength & " -- " & StringLen($ClearStringLength) & @CRLF)
;~ ConsoleWrite("G - " & $tempString & @CRLF)
;~ ConsoleWrite("MaX - " & $MaxStringLength & " --- " & StringLen($ClearStringLength) & @CRLF)
$Loesung=$Loesung+StringLen($ClearStringLength)
Next


;~ _ArrayDisplay($Input)

MsgBox(0,"2015_Day-8.1"," $MaxStringLength " & $MaxStringLength & "  Lösung " & $Loesung & " ("&$MaxStringLength-$Loesung) ;Lösung 1333 !!!!!!
;~ ;FALSCH: 1845  4044 2614 2864 5878 1118 1018 1111  falsch
ClipPut($MaxStringLength - $tempString)
;6310
;3564
;3349
;4049
;3127
;3975
;5292
;
#cs
(\\){2}|\\x[0-9][0-9]|\\"
$ wc -l input
300 = 300 lines in the input, so 600 quotes on the ends to remove
$ wc -c input
6789 = total characters in the input file
$ sed 's/\\"/@/g' input | sed 's/\\x[a-f0-9][a-f0-9]/~/g' | sed 's/\\\\/\\/g' | wc -c
6018 = total characters after unescaping things (which was a tad tricky)
#ce