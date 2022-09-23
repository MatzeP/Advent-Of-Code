#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 5: Doesn't He Have Intern-Elves For This? ---
Santa needs help figuring out which strings in his text file are naughty or nice.

A nice string is one with all of the following properties:

It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
For example:

ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
jchzalrnumimnmhp is naughty because it has no double letter.
haegwjzuvuyypxyu is naughty because it contains the string xy.
dvszwmarrgswjxmb is naughty because it contains only one vowel.
How many strings are nice?

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input="bgvyzdsv";"abcdef"
Global $Key=""
Global $Number=1
Global $End=False
Global $MD5Hash
Global $g_iAlgorithm = $CALG_MD5

_Crypt_Startup() ; To optimize performance start the crypt library.

Do
	$Key=$Input&$Number
	$MD5Hash =  _Crypt_HashData($Key, $g_iAlgorithm) ; Create a hash of the text entered.
	;ConsoleWrite($Key & " -- " & $MD5Hash & @CRLF)
	If (StringLeft($MD5Hash,8)="0x000000") Then
		$End=True
	Else
		$Number+=1
	EndIf
Until $End

 _Crypt_Shutdown() ; Shutdown the crypt library.
ClipPut($Number)
MsgBox(0,"2015_Day-4.2",$Number) ;Lösung 1038736
;_ArrayDisplay($aDimension)