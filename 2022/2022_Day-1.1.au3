#cs
--- Tag 1: Kalorienzählen ---
Rentiere des Weihnachtsmanns essen normalerweise normales Rentierfutter, aber sie brauchen viel magische Energie, um Geschenke an Weihnachten zu liefern. Dafür ist ihr Lieblingssnack eine besondere Art von Sternfrucht, die nur tief im Dschungel wächst. Die Elfen haben dich auf ihrer jährlichen Expedition zu dem Hain gebracht, wo die Früchte wachsen.

Um genügend magische Energie zu liefern, muss die Expedition bis zum 25. Dezember mindestens fünfzig Sterne zurückholen. Obwohl die Elben dir versichern, dass es im Hain reichlich Obst gibt, entscheidest du dich, für alle Fälle alle Früchte zu schnappen, die du unterwegs siehst.

Sammle Sterne, indem du Rätsel löst. An jedem Tag werden im Adventskalender zwei Rätsel zur Verfügung gestellt; Das zweite Puzzle wird freigeschaltet, wenn Sie das erste abgeschlossen haben. Jedes Puzzle gewährt einen Stern. Viel Glück!

Der Dschungel muss zu überwuchert und mit Fahrzeugen schwer zu befahren oder aus der Luft zu erreichen sein; Die Expedition der Elfen geht traditionell zu Fuß. Wenn sich Ihre Boote dem Land nähern, beginnen die Elfen mit der Bestandsaufnahme ihrer Vorräte. Eine wichtige Überlegung ist das Essen – insbesondere die Anzahl der Kalorien, die jeder Elf mit sich herumträgt (Ihre Rätseleingabe).

Die Elfen schreiben abwechselnd die Anzahl der Kalorien auf, die die verschiedenen Mahlzeiten, Snacks, Rationen usw. enthalten, die sie mitgebracht haben, ein Element pro Zeile. Jeder Elb trennt sein eigenes Inventar vom Inventar des vorherigen Elben (falls vorhanden) durch eine Leerzeile.

Nehmen wir zum Beispiel an, die Elfen schreiben die Kalorien ihrer Gegenstände fertig und erhalten am Ende die folgende Liste:

1000
2000
3000

4000

5000
6000

7000
8000
9000

10000
Diese Liste stellt die Kalorien des Essens dar, das von fünf Elfen getragen wird:

Der erste Elf trägt Essen mit 1000, 2000 und 3000 Kalorien, insgesamt 6000 Kalorien.
Der zweite Elf trägt ein Lebensmittel mit 4000 Kalorien.
Der dritte Elf trägt Lebensmittel mit 5000 und 6000 Kalorien, insgesamt 11000 Kalorien.
Der vierte Elf trägt Lebensmittel mit 7000, 8000 und 9000 Kalorien, insgesamt 24000 Kalorien.
Der fünfte Elf trägt ein Lebensmittel mit 10000 Kalorien.
Falls die Elben hungrig werden und zusätzliche Snacks benötigen, müssen sie wissen, welchen Elb sie fragen sollen: Sie möchten wissen, wie viele Kalorien der Elb trägt, der die meisten Kalorien trägt. Im obigen Beispiel ist dies 24000 (getragen vom vierten Elf).

Finde den Elfen mit den meisten Kalorien. Wie viele Kalorien trägt dieser Elf insgesamt?

--- Zweiter Teil ---
Bis Sie die Antwort auf die Frage der Elben berechnet haben, haben sie bereits erkannt, dass dem Elb, der die meisten Kalorien an Essen trägt, möglicherweise irgendwann die Snacks ausgehen.

Um diese inakzeptable Situation zu vermeiden, möchten die Elfen stattdessen die Gesamtkalorien wissen, die von den drei besten Elfen mit den meisten Kalorien getragen werden. Auf diese Weise haben sie, selbst wenn einem dieser Elfen die Snacks ausgehen, immer noch zwei Backups.

Im obigen Beispiel sind die drei besten Elfen die vierte Elfe (mit 24000 Kalorien), dann die dritte Elfe (mit 11000 Kalorien), dann die fünfte Elfe (mit 10000 Kalorien). Die Summe der von diesen drei Elfen getragenen Kalorien beträgt 45000.

Finde die drei besten Elfen mit den meisten Kalorien. Wie viele Kalorien tragen diese Elfen insgesamt?

#ce


#include <File.au3>
#include <Array.au3>
Local $Input
Local $result=-1
_FileReadToArray("2022_Day-1.txt",$Input,1)
;~ _ArrayDisplay($Input)

Local $Kalorien=0
Local $Elfcounter=0
Local $NewArray[0]

For $i=1 To $Input[0]
	If ($Input[$i] <> "") Then
		$Kalorien=$Kalorien + Number($Input[$i])
	Else
		$Elfcounter+=1
		_ArrayAdd($NewArray,$Kalorien)
		$Kalorien=0
	EndIf
Next
_ArraySort($NewArray,1)

MsgBox(0,"Day-1_StarTwo",$NewArray[0]+$NewArray[1]+$NewArray[2]) ;200044
ClipPut($NewArray[0]+$NewArray[1]+$NewArray[2])