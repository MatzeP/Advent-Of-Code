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
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
_FileReadToArray("2015-Day-5.1_Input.txt",$Input)

Global $niceStringsCount=0


For $i=1 To $Input[0]
	If StringRegExp($Input[$i],"[aeiou].*[aeiou].*[aeiou]")=1 Then
		If StringRegExp($Input[$i],"(.)\1")=1 Then
			If StringRegExp($Input[$i],"(ab|cd|pq|xy)")=0 Then
				;MsgBox(0,"NiceString",$Input[$i])
				$niceStringsCount+=1
			EndIf
		EndIf
	EndIf
Next

ClipPut($niceStringsCount)
MsgBox(0,"2015_Day-5.1",$niceStringsCount) ;Lösung 255
;_ArrayDisplay($aDimension)