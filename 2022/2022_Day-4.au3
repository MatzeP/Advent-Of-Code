#cs
--- Tag 4: Aufräumarbeiten im Lager ---
Platz muss geräumt werden, bevor die letzten Vorräte von den Schiffen entladen werden können, und so wurde mehreren Elfen die Aufgabe übertragen, Teile des Lagers zu säubern. Jeder Abschnitt hat eine eindeutige ID-Nummer, und jedem Elf ist eine Reihe von Abschnitts-IDs zugewiesen.

Als einige der Elfen jedoch ihre Abschnittszuweisungen miteinander vergleichen, haben sie bemerkt, dass sich viele der Zuweisungen überschneiden. Um zu versuchen, Überschneidungen schnell zu finden und Doppelarbeit zu reduzieren, bilden die Elfen Paare und erstellen eine große Liste der Abschnittszuweisungen für jedes Paar (Ihre Rätseleingabe).

Betrachten Sie beispielsweise die folgende Liste von Abschnittszuweisungspaaren:

2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
Für die ersten Paare bedeutet diese Liste:

Innerhalb des ersten Elbenpaares wurden dem ersten Elben die Sektionen 2-4 (Sektionen 2, 3 und 4) zugewiesen, während dem zweiten Elben die Sektionen 6-8 (Sektionen 6, 7, 8) zugewiesen wurden.
Den Elfen im zweiten Paar wurden jeweils zwei Sektionen zugeteilt.
Den Elfen im dritten Paar wurden jeweils drei Abschnitte zugeteilt: Einer bekam die Abschnitte 5, 6 und 7, während der andere ebenfalls 7, plus 8 und 9 bekam.
Diese Beispielliste verwendet einstellige Abschnitts-IDs, um das Zeichnen zu vereinfachen; Ihre tatsächliche Liste enthält möglicherweise größere Zahlen. Visuell sehen diese Paare von Abschnittszuweisungen so aus:

.234..... 2-4
.....678. 6-8

.23...... 2-3
...45.... 4-5

....567.. 5-7
......789 7-9

.2345678. 2-8
..34567.. 3-7

.....6... 6-6
...456... 4-6

.23456... 2-6
...45678. 4-8
Einige der Paare haben bemerkt, dass eine ihrer Aufgaben die andere vollständig enthält. Zum Beispiel enthält 2-8 vollständig 3-7 und 6-6 ist vollständig in 4-6 enthalten. In Paaren, in denen eine Aufgabe die andere vollständig enthält, würde ein Elf im Paar ausschließlich Abschnitte reinigen, deren Partner bereits reinigen wird, so dass diese am dringendsten einer Überprüfung bedürfen. In diesem Beispiel gibt es 2 solche Paare.

Bei wie vielen Zuordnungspaaren enthält ein Bereich den anderen vollständig?
#ce


#include <File.au3>
#include <Array.au3>
Local $Input
Local $result=-1
_FileReadToArray("2022_Day-4.txt",$Input,1)
;~ _ArrayDisplay($Input)

Global $Summe=0

For $i=1 To $Input[0]
	Local $Pair=StringSplit($Input[$i],",")
	Local $ElfOne=StringSplit($Pair[1],"-")
	Local $ElfTwo=StringSplit($Pair[2],"-")

;~ 2-8,3-7
;~ 6-6,4-6

	If ((Number($ElfOne[1]) <= Number($ElfTwo[1])) And (Number($ElfOne[2]) >= Number($ElfTwo[2]))) Then
		$Summe+=1
;~ 		MsgBox(0,"1_("&$i&")"&$Summe,$Input[$i])
	ElseIf ((Number($ElfOne[1]) >= Number($ElfTwo[1])) And (Number($ElfOne[2]) <= Number($ElfTwo[2]))) Then
		$Summe+=1
;~ 		MsgBox(0,"2_("&$i&")"&$Summe,$Input[$i])
	EndIf
Next

MsgBox(0,"Day-4_StarOne",$Summe) ;584
ClipPut($Summe)
