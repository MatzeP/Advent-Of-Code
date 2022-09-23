#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 4: The Ideal Stocking Stuffer ---
Santa needs help mining some AdventCoins (very similar to bitcoins) to use as gifts for all the economically forward-thinking little girls and boys.

To do this, he needs to find MD5 hashes which, in hexadecimal, start with at least five zeroes. The input to the MD5 hash is some secret key (your puzzle input, given below) followed by a number in decimal. To mine AdventCoins, you must find Santa the lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash.

For example:

If your secret key is abcdef, the answer is 609043, because the MD5 hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it is the lowest such number to do so.
If your secret key is pqrstuv, the lowest number it combines with to make an MD5 hash starting with five zeroes is 1048970; that is, the MD5 hash of pqrstuv1048970 looks like 000006136ef....
Your puzzle input is bgvyzdsv.

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