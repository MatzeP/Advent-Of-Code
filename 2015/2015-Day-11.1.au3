#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------
--- Day 11: Corporate Policy ---
Santa's previous password expired, and he needs help choosing a new one.

To help him remember his new password after the old one expires, Santa has devised a method of coming up with a password based on the previous one. Corporate policy dictates that passwords must be exactly eight lowercase letters (for security reasons), so he finds his new password by incrementing his old password string repeatedly until it is valid.

Incrementing is just like counting with numbers: xx, xy, xz, ya, yb, and so on. Increase the rightmost letter one step; if it was z, it wraps around to a, and repeat with the next letter to the left until one doesn't wrap around.

Unfortunately for Santa, a new Security-Elf recently started, and he has imposed some additional password requirements:

Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
For example:

hijklmmn meets the first requirement (because it contains the straight hij) but fails the second requirement requirement (because it contains i and l).
abbceffg meets the third requirement (because it repeats bb and ff) but fails the first requirement.
abbcegjk fails the third requirement, because it only has one double letter (bb).
The next password after abcdefgh is abcdffaa.
The next password after ghijklmn is ghjaabcc, because you eventually skip all the passwords that start with ghi..., since i is not allowed.
Given Santa's current password (your puzzle input), what should his next password be?

Your puzzle input is cqjxjnds.

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
$Input="cqjxjnds"
Global $letters=_ArrayFromString("a,b,c,d,e,f,g,h,k,m,n,o,p,q,r,s,t,u,v,w,x,y,z",",")
_ArrayDisplay($letters)
Global $InputSplit=""
Global $Previous=""
Global $result=""
Global $Count=""
Global $StartPos=1000000

	Local $iPos=StringInStr($Input,"i",0,1,1)
	Local $jPos=StringInStr($Input,"j",0,1,1)
	Local $lPos=StringInStr($Input,"l",0,1,1)
	If (($iPos > 0) And ($iPos < $StartPos)) Then
			$StartPos=$iPos
	EndIf
	If (($jPos > 0) And ($jPos < $StartPos)) Then
			$StartPos=$jPos
	EndIf
	If (($lPos > 0) And ($lPos < $StartPos)) Then
			$StartPos=$lPos
	EndIf
	MsgBox(0,"StartPos",$StartPos & @CRLF & StringLen($Input))

	Exit
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
			$result=$result&$Count&$Previous
			$Count=1
			$Previous=$InputSplit[$i]
;~ 			ConsoleWrite("3- Input: " & $Input & " Count: " & $Count & " Result: " & $result & @CRLF)
		EndIf
;~ ConsoleWrite($a & " -- " & $i & "/" & $InputSplit[0] & @CRLF)
	Next
	$result=$result&$Count&$Previous


MsgBox(0,"2015_Day-11.1","Result: (" & $result&") ") ;Lösung
;~ ;FALSCH:
ClipPut($result)