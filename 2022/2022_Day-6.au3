#cs
--- Tag 6: Abstimmungsprobleme ---
Die Vorbereitungen sind endlich abgeschlossen; Sie und die Elfen verlassen das Lager zu Fuß und machen sich auf den Weg zum Sternenfruchthain.

Während Sie sich durch das dichte Unterholz bewegen, gibt Ihnen einer der Elfen ein Handgerät. Er sagt, dass es viele ausgefallene Funktionen hat, aber das wichtigste, das jetzt eingerichtet werden muss, ist das Kommunikationssystem.

Da er jedoch gehört hat, dass Sie beträchtliche Erfahrung im Umgang mit signalbasierten Systemen haben, hat er die anderen Elben davon überzeugt, dass es in Ordnung wäre, Ihnen ihr einziges defektes Gerät zu geben – Sie werden sicherlich kein Problem haben, es zu reparieren.

Wie von komödiantischem Timing inspiriert, versprüht das Gerät ein paar bunte Funken.

Um mit den Elfen kommunizieren zu können, muss das Gerät ihr Signal erfassen. Das Signal besteht aus einer Reihe scheinbar zufälliger Zeichen, die das Gerät einzeln empfängt.

Um das Kommunikationssystem zu reparieren, müssen Sie dem Gerät eine Unterroutine hinzufügen, die eine Start-of-Packet-Markierung im Datenstrom erkennt. In dem von den Elfen verwendeten Protokoll wird der Anfang eines Pakets durch eine Folge von vier Zeichen angezeigt, die alle unterschiedlich sind.

Das Gerät sendet Ihrer Subroutine einen Datenstrompuffer (Ihre Rätseleingabe); Ihr Unterprogramm muss die erste Position identifizieren, an der die vier zuletzt empfangenen Zeichen alle unterschiedlich waren. Insbesondere muss die Anzahl der Zeichen vom Anfang des Puffers bis zum Ende der ersten solchen Markierung aus vier Zeichen gemeldet werden.

Angenommen, Sie erhalten den folgenden Datenstrompuffer:

mjqjpqmgbljsphdztnvjfqwrcgsmlb
Nachdem die ersten drei Zeichen (mjq) empfangen wurden, wurden noch nicht genügend Zeichen empfangen, um die Markierung zu finden. Das erste Mal, dass eine Markierung auftreten könnte, ist nach dem Empfang des vierten Zeichens, wodurch die letzten vier Zeichen mjqj werden. Da j wiederholt wird, ist dies kein Marker.

Das erste Mal, dass eine Markierung erscheint, ist nach dem siebten Zeichen. Sobald dies der Fall ist, sind die letzten vier empfangenen Zeichen jpqm, die alle unterschiedlich sind. In diesem Fall sollte Ihr Unterprogramm den Wert 7 zurückmelden, da die erste Start-of-Packet-Markierung vollständig ist, nachdem 7 Zeichen verarbeitet wurden.

Hier noch ein paar Beispiele:

bvwbjplbgvbhsrlpgdmjqwftvncz: erste Markierung nach Ziffer 5
nppdvjthqldpwncqszvftbrmjlhg: erste Markierung nach Zeichen 6
nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg: erste Markierung nach Zeichen 10
zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw: erste Markierung nach Zeichen 11
Wie viele Zeichen müssen verarbeitet werden, bevor die erste Start-of-Packet-Markierung erkannt wird?
#ce


#include <File.au3>
#include <Array.au3>
Global $Input
Global $result=-1
_FileReadToArray("2022_Day-6.txt",$Input,1)
;~ _ArrayDisplay($Input)
Global $StrigInput=StringSplit($Input[1],"")
Global $MarkerString=""
Global $StringBuffer=""
Global $MarkerPos=0


For $i=1 To $StrigInput[0]
	$StringBuffer&=$StrigInput[$i]
If	(Number(StringLen($StringBuffer)) > 4) Then
	$MarkerString=StringRight($StringBuffer,4)
	$result=CheckIfNotDouble($MarkerString)
	If $result Then
		$MarkerPos=$i
		ExitLoop
	EndIf
EndIf
Next

MsgBox(0,"Day-6_StarOne",$MarkerPos) ;1723
ClipPut($MarkerPos)

Func CheckIfNotDouble($StringToCheck)
	Local $Split=StringSplit($StringToCheck,"")
	If $Split[1] = $Split[2] Then
		Return False
	ElseIf $Split[1] = $Split[3] Then
		Return False
	ElseIf $Split[1] = $Split[4] Then
		Return False
	ElseIf $Split[2] = $Split[3] Then
		Return False
	ElseIf $Split[2] = $Split[4] Then
		Return False
	ElseIf $Split[3] = $Split[4] Then
		Return False
	Else
		Return True
	EndIf
EndFunc