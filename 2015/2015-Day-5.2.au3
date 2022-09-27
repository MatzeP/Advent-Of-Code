#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Part Two ---
Realizing the error of his ways, Santa has switched to a better model of determining whether a string is naughty or nice. None of the old rules apply, as they are all clearly ridiculous.

Now, a nice string is one with all of the following properties:

It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.
For example:

qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) and a letter that repeats with exactly one letter between them (zxz).
xxyxx is nice because it has a pair that appears twice and a letter that repeats with one between, even though the letters used by each rule overlap.
uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat with a single letter between them.
ieodomkazucvgmuy is naughty because it has a repeating letter with one between (odo), but no pair that appears twice.
How many strings are nice under these new rules?

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
	If StringRegExp($Input[$i],"(..).*\1")=1 Then ; --> (..)=eine Gruppe aus zwei Zeichen .* = ein beliebiges Zeichen unendl. Wiederholung \1= Gruppe 1 Inhalt von der ()
		If StringRegExp($Input[$i],"(.).\1")=1 Then ; --> (.) = Eine Gruppe aus einem beliebigen Zeichen .=ein beliebiges Zeichen \1 Gruppe 1 Inhalt der ()
;~ 			MsgBox(0,"NiceString",$Input[$i])
			$niceStringsCount+=1
		EndIf
	EndIf
Next

ClipPut($niceStringsCount)
MsgBox(0,"2015_Day-5.2",$niceStringsCount) ;Lösung 55
;_ArrayDisplay($aDimension)