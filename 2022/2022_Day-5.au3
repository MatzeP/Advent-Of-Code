#cs
--- Tag 5: Vorratsstapel ---
Sobald die letzten Vorräte von den Schiffen entladen sind, kann die Expedition aufbrechen. Vorräte werden in Stapeln markierter Kisten gelagert, aber da die benötigten Vorräte unter vielen anderen Kisten vergraben sind, müssen die Kisten neu angeordnet werden.

Das Schiff verfügt über einen riesigen Frachtkran, der Kisten zwischen Stapeln bewegen kann. Damit keine der Kisten zerquetscht wird oder umfällt, ordnet der Kranführer sie in einer Reihe von sorgfältig geplanten Schritten neu an. Nachdem die Kisten neu angeordnet wurden, befinden sich die gewünschten Kisten oben auf jedem Stapel.

Die Elfen wollen die Kranführerin bei dieser heiklen Prozedur nicht unterbrechen, haben aber vergessen, sie zu fragen, welche Kiste wo landet, und wollen so schnell wie möglich zum Abladen bereit sein, damit sie an Bord gehen können.

Sie haben jedoch eine Zeichnung der Startstapel von Kisten und des Umordnungsverfahrens (Ihre Rätseleingabe). Zum Beispiel:

     [D]
[N] [C]
[Z] [M] [P]
  1 2 3

Verschiebe 1 von 2 auf 1
Bewege 3 von 1 nach 3
Verschiebe 2 von 2 auf 1
1 von 1 auf 2 verschieben
In diesem Beispiel gibt es drei Kistenstapel. Stapel 1 enthält zwei Kisten: Kiste Z ist unten und Kiste N ist oben. Stapel 2 enthält drei Kisten; von unten nach oben sind es die Kisten M, C und D. Schließlich enthält Stapel 3 eine einzelne Kiste, P.

Dann wird das Umordnungsverfahren angegeben. In jedem Verfahrensschritt wird eine Menge Kisten von einem Stapel auf einen anderen Stapel bewegt. Im ersten Schritt des obigen Umordnungsverfahrens wird eine Kiste von Stapel 2 auf Stapel 1 bewegt, was zu dieser Konfiguration führt:

[D]
[N] [C]
[Z] [M] [P]
  1 2 3
Im zweiten Schritt werden drei Kisten von Stapel 1 auf Stapel 3 verschoben. Die Kisten werden einzeln verschoben, sodass die erste zu verschiebende Kiste (D) unter der zweiten und dritten Kiste landet:

      [Z]
      [N]
 [C]  [D]
 [M]  [P]
  1 2 3
Dann werden beide Kisten von Stapel 2 auf Stapel 1 bewegt. Da Kisten nacheinander bewegt werden, landet Kiste C wieder unter Kiste M:

         [Z]
         [N]
[M] [D]
[C] [P]
  1 2 3
Schließlich wird eine Kiste von Stapel 1 auf Stapel 2 verschoben:

         [Z]
         [N]
         [D]
[C] [M] [P]
  1 2 3
Die Elfen müssen nur wissen, welche Kiste oben auf jedem Stapel landet; In diesem Beispiel sind die obersten Kisten C in Stapel 1, M in Stapel 2 und Z in Stapel 3, also sollten Sie diese kombinieren und den Elfen die Nachricht CMZ geben.

Welche Kiste landet nach Abschluss des Umordnungsverfahrens oben auf jedem Stapel?
#ce


#include <File.au3>
#include <Array.au3>
Global $Input
Global $result=-1
_FileReadToArray("2022_Day-5.txt",$Input,1)
;~ _ArrayDisplay($Input)
#cs
                    [L]     [H] [W]
                [J] [Z] [J] [Q] [Q]
[S]             [M] [C] [T] [F] [B]
[P]     [H]     [B] [D] [G] [B] [P]
[W]     [L] [D] [D] [J] [W] [T] [C]
[N] [T] [R] [T] [T] [T] [M] [M] [G]
[J] [S] [Q] [S] [Z] [W] [P] [G] [D]
[Z] [G] [V] [V] [Q] [M] [L] [N] [R]
 1   2   3   4   5   6   7   8   9
#ce
Global $Stapel1=["Z","J","N","W","P","S"]
Global $Stapel2=["G","S","T"]
Global $Stapel3=["V","Q","R","L","H"]
Global $Stapel4=["V","S","T","D"]
Global $Stapel5=["Q","Z","T","D","B","M","J"]
Global $Stapel6=["M","W","T","J","D","C","Z","L"]
Global $Stapel7=["L","P","M","W","G","T","J"]
Global $Stapel8=["N","G","M","T","B","F","Q","H"]
Global $Stapel9=["R","D","G","C","P","B","Q","W"]

Global $Code="NurDieRuhe"
Global $ToDo, $Boxes, $FromStapel, $ToStapel

;~ _ArrayDisplay($Stapel1)
;~ move 1 from 2 to 1

Global $StapelArray
For $i=1 To $Input[0]
	If StringRegExp($Input[$i],"move\s(\d+)\sfrom\s(\d+)\sto\s(\d+)") Then
		$ToDo=StringRegExp($Input[$i],"move\s(\d+)\sfrom\s(\d+)\sto\s(\d+)",3)
;~ 		_ArrayDisplay($ToDo,"ToDo")
		$Boxes=Number($ToDo[0])
		$FromStapel=StapelToTemp($ToDo[1])
		$ToStapel=StapelToTemp($ToDo[2])

;~ 		_ArrayDisplay($FromStapel,"Von Stapel " & $ToDo[1])
;~ 		_ArrayDisplay($ToStapel,"Nach Stapel " & $ToDo[2])

		For $j=1 To $Boxes
			Local $value=_ArrayPop($FromStapel)
			_ArrayAdd($ToStapel,$value)
		Next
		 TempToStapel($FromStapel,$ToDo[1])
		 TempToStapel($ToStapel,$ToDo[2])

;~ 		_ArrayDisplay($FromStapel,"NEU Von Stapel " & $ToDo[1])
;~ 		_ArrayDisplay($ToStapel,"NEU Nach Stapel " & $ToDo[2])
	EndIf
Next
;~ _ArrayDisplay($Stapel1,"Stapel 1")
;~ _ArrayDisplay($Stapel2,"Stapel 2")
;~ _ArrayDisplay($Stapel3,"Stapel 3")
;~ _ArrayDisplay($Stapel4,"Stapel 4")
;~ _ArrayDisplay($Stapel5,"Stapel 5")
;~ _ArrayDisplay($Stapel6,"Stapel 6")
;~ _ArrayDisplay($Stapel7,"Stapel 7")
;~ _ArrayDisplay($Stapel8,"Stapel 8")
;~ _ArrayDisplay($Stapel9,"Stapel 9")

;~ $Code=$Stapel1[UBound($Stapel1)-1]&$Stapel2[UBound($Stapel2)-1]&$Stapel3[UBound($Stapel3)-1]
$Code=_ArrayPop($Stapel1)&_ArrayPop($Stapel2)&_ArrayPop($Stapel3)&_ArrayPop($Stapel4)&_ArrayPop($Stapel5)&_ArrayPop($Stapel6)&_ArrayPop($Stapel7)&_ArrayPop($Stapel8)&_ArrayPop($Stapel9)
MsgBox(0,"Day-5_StarOne",$Code) ;MQTPGLLDN
ClipPut($Code)

Func StapelToTemp($Nummer)
	Local $return
	Switch $Nummer
		Case 1
			$return=$Stapel1
		Case 2
			$return=$Stapel2
		Case 3
			$return=$Stapel3
		Case 4
			$return=$Stapel4
		Case 5
			$return=$Stapel5
		Case 6
			$return=$Stapel6
		Case 7
			$return=$Stapel7
		Case 8
			$return=$Stapel8
		Case 9
			$return=$Stapel9
	EndSwitch

	Return $return
EndFunc

Func TempToStapel($Array, $Nummer)
	Switch $Nummer
		Case 1
			$Stapel1=$Array
		Case 2
			$Stapel2=$Array
		Case 3
			$Stapel3=$Array
		Case 4
			$Stapel4=$Array
		Case 5
			$Stapel5=$Array
		Case 6
			$Stapel6=$Array
		Case 7
			$Stapel7=$Array
		Case 8
			$Stapel8=$Array
		Case 9
			$Stapel9=$Array
	EndSwitch
EndFunc