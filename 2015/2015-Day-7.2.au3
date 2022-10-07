#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Change2CUI=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

--- Day 7: Some Assembly Required ---
--- Part Two ---
Now, take the signal you got on wire a, override wire b to that signal, and reset the other wires (including wire a). What new signal is ultimately provided to wire a?

#ce ----------------------------------------------------------------------------

#include <array.au3>
#include <file.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <StringConstants.au3>
#include <WinAPIConv.au3>


Global $Input
_FileReadToArray("2015-Day-7.2_Input.txt",$Input)

;~ Global $aLightArray[1000][1000]

;~ For $i=0 To 999
;~ 	For $j=0 To 999
;~ 		$aLightArray[$i][$j]=0
;~ 	Next
;~ Next

Global $InputSplit
Global $aWireArray[1][2]
Global $res=""
Global $ValueOne
Global $ValueTwo

Do
	For $a=1 To $Input[0]
;~ 		ConsoleWrite("("&$a&") - "&$Input[$a]&@CRLF)
		If StringRegExp($Input[$a],"^(\d+)\s->\s(\w+)") = 1 Then
			$InputSplit=StringRegExp($Input[$a],"^(\d+)\s->\s(\w+)",3)
;~ 			ConsoleWrite($InputSplit[1] & " = " & $InputSplit[0] &@CRLF)
				$res=$InputSplit[1]&"|"&Number($InputSplit[0])
				_ArrayAdd($aWireArray,$res)
				$aWireArray[0][0]=UBound($aWireArray)-1
				$Input[$a]=""
		ElseIf StringRegExp($Input[$a],"^NOT\s(\w+)\s->\s(\w+)") = 1 Then
			$InputSplit=StringRegExp($Input[$a],"^NOT\s(\w+)\s->\s(\w+)",3)
;~ 			ConsoleWrite("NOT - " & $InputSplit[0] & @CRLF)
			For $u=1 To $aWireArray[0][0]
				$ValueOne=_ArraySearch($aWireArray,$InputSplit[0])
				If ($ValueOne >= 0) Then
					$res=$InputSplit[1]&"|"&BitNOT(Number($aWireArray[$ValueOne][1]))
;~ 					ConsoleWrite("NOT - " & $InputSplit[1]&" = "&BitNOT(Number($aWireArray[$ValueOne][1])) & @CRLF)
					_ArrayAdd($aWireArray,$res)
;~ 					$aWireArray[0][0]=UBound($aWireArray)-1
					$Input[$a]=""
					ExitLoop
				EndIf
			Next
		ElseIf StringRegExp($Input[$a],"^(\d+)\s(\w+)\s(\w+)\s->\s(\w+)")=1 Then
			$InputSplit=StringRegExp($Input[$a],"^(\d+)\s(\w+)\s(\w+)\s->\s(\w+)",3)
;~ 			ConsoleWrite("ZAHL SHIFT/AND/OR BUCHSTABE -> BUCHSTABE - " & $InputSplit[1] & " - " & $InputSplit[0] & " - , " & $InputSplit[2] & @CRLF)
;~ 			_ArrayDisplay($InputSplit,"BIT")
				If ((($InputSplit[1] = "LSHIFT") Or ($InputSplit[1] = "RSHIFT") Or ($InputSplit[1] = "AND") Or ($InputSplit[1] = "OR")) AND (StringRegExp($InputSplit[0],"\d+"))) Then
					$ValueOne=$InputSplit[0]
					$ValueTwo=_ArraySearch($aWireArray,$InputSplit[2])

					If $ValueTwo >= 0 Then
						For $k=1 To $aWireArray[0][0]
							Switch $InputSplit[1]
								Case "LSHIFT"
									$res=$InputSplit[3]&"|"&BitShift(Number($ValueOne),-Number($aWireArray[$ValueTwo][1]))
;~ 									ConsoleWrite("aLSHIFT - " & $InputSplit[3] & " = " & BitShift(Number($ValueOne),-Number($aWireArray[$ValueTwo][1])) & @CRLF)
								Case "RSHIFT"
									$res=$InputSplit[3]&"|"&BitShift(Number($ValueOne),Number($aWireArray[$ValueTwo][1]))
;~ 									ConsoleWrite("aRSHIFT - " & $InputSplit[3] & " = " & BitShift(Number($ValueOne),Number($aWireArray[$ValueTwo][1])) & @CRLF)
								Case "AND"
										$res=$InputSplit[3]&"|"&BitAND(Number($ValueOne),Number($aWireArray[$ValueTwo][1]))
;~ 										ConsoleWrite("aAND - " & $InputSplit[3] & " = " & BitAND(Number($ValueOne),Number($aWireArray[$ValueTwo][1])) & @CRLF)
								Case "OR"
									$res=$InputSplit[3]&"|"&BitOR(Number($ValueOne),Number($aWireArray[$ValueTwo][1]))
;~ 									ConsoleWrite("aOR - " & $InputSplit[3] & " = " & BitOR(Number($ValueOne),Number($aWireArray[$ValueTwo][1])) & @CRLF)
							EndSwitch
							_ArrayAdd($aWireArray,$res)
							$res=""
							$Input[$a]=""
		;~ 					_ArrayDisplay($aWireArray)
							ExitLoop
						Next
					EndIf
				EndIf
				$ValueOne=""
				$ValueTwo=""
		ElseIf StringRegExp($Input[$a],"^(\w+)\s(\w+)\s(\d+)\s->\s(\w+)")=1 Then
				$InputSplit=StringRegExp($Input[$a],"^(\w+)\s(\w+)\s(\d+)\s->\s(\w+)",3)
;~ 				ConsoleWrite("BUCHSTABE SHIFT/AND/OR ZAHL -> BUCHSTABE - " & $InputSplit[1] & " - " & $InputSplit[0] & " - , " & $InputSplit[2] & @CRLF)

				If ((($InputSplit[1] = "LSHIFT") Or ($InputSplit[1] = "RSHIFT") Or ($InputSplit[1] = "AND") Or ($InputSplit[1] = "OR")) AND (StringRegExp($InputSplit[2],"\d+"))) Then

					$ValueOne=_ArraySearch($aWireArray,$InputSplit[0])
					$ValueTwo=$InputSplit[2]

					If $ValueOne >= 0 Then
						For $k=1 To $aWireArray[0][0]
							Switch $InputSplit[1]
								Case "LSHIFT"
									$res=$InputSplit[3]&"|"&BitShift(Number($aWireArray[$ValueOne][1]),-Number($ValueTwo))
;~ 									ConsoleWrite("aLSHIFT - " & $InputSplit[3] & " = " & BitShift(Number($aWireArray[$ValueOne][1]),-Number($ValueTwo)) & @CRLF)
								Case "RSHIFT"
									$res=$InputSplit[3]&"|"&BitShift(Number($aWireArray[$ValueOne][1]),Number($ValueTwo))
;~ 									ConsoleWrite("aRSHIFT - " & $InputSplit[3] & " = " & BitShift(Number($aWireArray[$ValueOne][1]),Number($ValueTwo)) & @CRLF)
								Case "AND"
										$res=$InputSplit[3]&"|"&BitAND(Number($aWireArray[$ValueOne][1]),Number($ValueTwo))
;~ 										ConsoleWrite("aAND - " & $InputSplit[3] & " = " & BitAND(Number($aWireArray[$ValueOne][1]),Number($ValueTwo)) & @CRLF)
								Case "OR"
									$res=$InputSplit[3]&"|"&BitOR(Number($aWireArray[$ValueOne][1]),Number($ValueTwo))
;~ 									ConsoleWrite("aOR - " & $InputSplit[3] & " = " & BitOR(Number($aWireArray[$ValueOne][1]),Number($ValueTwo)) & @CRLF)
							EndSwitch
							_ArrayAdd($aWireArray,$res)
							$res=""
							$Input[$a]=""
							ExitLoop
						Next
					EndIf
				EndIf
				$ValueOne=""
				$ValueTwo=""
		ElseIf StringRegExp($Input[$a],"^(\w+)\s(\w+)\s(\w+)\s->\s(\w+)")=1 Then
					$InputSplit=StringRegExp($Input[$a],"^(\w+)\s(\w+)\s(\w+)\s->\s(\w+)",3) ;OKAY Buchstabe SHIFT/AND/OR/ Buchstabe -> BUCHSTABE
;~ 					ConsoleWrite("BUCHSTABE SHIFT/AND/OR BUCHSTABE -> BUCHSTABE - " & $InputSplit[1] & " - " & $InputSplit[0] & " - , " & $InputSplit[2] & @CRLF)
					If (($InputSplit[1] = "LSHIFT") Or ($InputSplit[1] = "RSHIFT") Or ($InputSplit[1] = "AND") Or ($InputSplit[1] = "OR")) Then
						For $h=1 To $aWireArray[0][0]
							If ((StringRegExp($InputSplit[0],"\D+")) And (StringRegExp($InputSplit[2],"\D+"))) Then
;~ 								MsgBox(0,"LR-SHIFT_h="&$h,"Z1. "&  $InputSplit[0] & " -> " &  (StringRegExp($InputSplit[0],"\w+")) &"=="& $InputSplit[2] & " -> " & (StringRegExp($InputSplit[2],"\w+")))
								$ValueOne=_ArraySearch($aWireArray,$InputSplit[0])
								$ValueTwo=_ArraySearch($aWireArray,$InputSplit[2])

								If (($ValueOne >=0) And ($ValueTwo >= 0))  Then
;~ 									ConsoleWrite("$ValueOne - "  & $ValueOne & "[ " & $aWireArray[$ValueOne][1] & " ] / $ValueTwo - " & $ValueTwo & "[ " & $aWireArray[$ValueTwo][1] & " ]" & @CRLF)
	;~ 								MsgBox(0,"LR-SHIFT_h="&$h,"Z1. "& $aWireArray[$ValueOne][1] &"=="& $aWireArray[$ValueTwo][1])
									Switch $InputSplit[1]
										Case "LSHIFT"
											$res=$InputSplit[3]&"|"&BitShift(Number($aWireArray[$ValueOne][1]),-Number($aWireArray[$ValueTwo][1]))
;~ 											ConsoleWrite("LSHIFT - "  & $InputSplit[3] & " = " & BitShift(Number($aWireArray[$ValueOne][1]),-Number($aWireArray[$ValueTwo][1])) & @CRLF)
;~ 											ConsoleWrite("LSHIFT - "  & $InputSplit[3] & " = BitShift(Number("&$aWireArray[$ValueOne][1]&"),-Number("&$aWireArray[$ValueTwo][1]&"))" & @CRLF)
										Case "RSHIFT"
											$res=$InputSplit[3]&"|"&BitShift(Number($aWireArray[$ValueOne][1]),Number($aWireArray[$ValueTwo][1]))
;~ 											ConsoleWrite("RSHIFT - "  & $InputSplit[3] & " = " & BitShift(Number($aWireArray[$ValueOne][1]),Number($aWireArray[$ValueTwo][1])) & @CRLF)
;~ 											ConsoleWrite("RSHIFT - "  & $InputSplit[3] & " = BitShift(Number("&$aWireArray[$ValueOne][1]&"),Number("&$aWireArray[$ValueTwo][1]&"))" & @CRLF)
										Case "AND"
											$res=$InputSplit[3]&"|"&BitAND(Number($aWireArray[$ValueOne][1]),Number($aWireArray[$ValueTwo][1]))
;~ 											ConsoleWrite("AND - " & $InputSplit[3] & " = " & BitAND(Number($aWireArray[$ValueOne][1]),Number($aWireArray[$ValueTwo][1])) & @CRLF)
;~ 											ConsoleWrite("AND - "  & $InputSplit[3] & " = BitAND(Number("&$aWireArray[$ValueOne][1]&"),Number("&$aWireArray[$ValueTwo][1]&"))" & @CRLF)
										Case "OR"
											$res=$InputSplit[3]&"|"&BitOR(Number($aWireArray[$ValueOne][1]),Number($aWireArray[$ValueTwo][1]))
;~ 											ConsoleWrite("OR - " & $InputSplit[3] & " = " & BitOR(Number($aWireArray[$ValueOne][1]),Number($aWireArray[$ValueTwo][1])) & @CRLF)
;~ 											ConsoleWrite("OR - "  & $InputSplit[3] & " = BitOR(Number("&$aWireArray[$ValueOne][1]&"),Number("&$aWireArray[$ValueTwo][1]&"))" & @CRLF)
									EndSwitch
									_ArrayAdd($aWireArray,$res)
	;~ 								$aWireArray[0][0]=UBound($aWireArray)-1
									$res=""
									$Input[$a]=""
	;~ 								_ArrayDisplay($aWireArray)
									ExitLoop
								EndIf
							EndIf
						Next
						$ValueOne=""
						$ValueTwo=""
					EndIf
				$aWireArray[0][0]=UBound($aWireArray)-1
		EndIf
;~ 	ConsoleWrite("ONE - ENDE" & @CRLF)
	Next
	_ArraySort($Input,1,1)
;~ 	_ArrayDisplay($Input)
	For $a=$Input[0] To 1 Step -1
		If $Input[$a]="" Then
		_ArrayDelete($Input,$a)
		EndIf
	Next
	$Input[0]=UBound($Input)-1
;~ 	ToolTip($aWireArray[0][0]&"/"&$Input[0])
;~ 	_ArrayDisplay($Input)
;~ 	_ArrayDisplay($aWireArray)
Until $Input[0]=1
_ArrayDisplay($Input)
_ArraySort($aWireArray)
_ArrayDisplay($aWireArray)
;~ ClipPut($LightBrightness)
MsgBox(0,"2015_Day-7.1","") ;Lösung 956
