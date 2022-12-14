#cs
--- Tag 3: Rucksackumbau ---
Ein Elf hat die wichtige Aufgabe, alle Rucksäcke mit Vorräten für die Dschungelreise zu beladen. Leider hat sich dieser Elf nicht ganz an die Verpackungsanweisungen gehalten, und so müssen jetzt einige Artikel umsortiert werden.

Jeder Rucksack hat zwei große Fächer. Alle Artikel einer bestimmten Art sollen in genau eines der beiden Fächer passen. Der Elf, der das Packen durchgeführt hat, hat diese Regel für genau einen Gegenstandstyp pro Rucksack nicht befolgt.

Die Elfen haben eine Liste aller Gegenstände erstellt, die sich derzeit in jedem Rucksack befinden (Ihre Rätseleingabe), aber sie brauchen Ihre Hilfe, um die Fehler zu finden. Jeder Elementtyp wird durch einen einzelnen Klein- oder Großbuchstaben identifiziert (d. h. a und A beziehen sich auf unterschiedliche Elementtypen).

Die Liste der Artikel für jeden Rucksack wird als Zeichen in einer einzigen Zeile angegeben. Ein gegebener Rucksack hat immer die gleiche Anzahl von Gegenständen in jedem seiner zwei Fächer, so dass die erste Hälfte der Zeichen Gegenstände im ersten Fach darstellt, während die zweite Hälfte der Zeichen Gegenstände im zweiten Fach darstellt.

Angenommen, Sie haben die folgende Inhaltsliste von sechs Rucksäcken:

vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
Der erste Rucksack enthält die Items vJrwpWtwJgWrhcsFMMfFFhFp, d. h. sein erstes Fach enthält die Items vJrwpWtwJgWr, während das zweite Fach die Items hcsFMMfFFhFp enthält. Der einzige Elementtyp, der in beiden Fächern erscheint, ist das kleine p.
Die Fächer des zweiten Rucksacks enthalten jqHRNqRjqzjGDLGL und rsFMfFZSrLrFZsSL. Der einzige Elementtyp, der in beiden Fächern erscheint, ist das große L.
Die Fächer des dritten Rucksacks enthalten PmmdzqPrV und vPwwTWBwg; Der einzige gemeinsame Elementtyp ist der Großbuchstabe P.
Die Fächer des vierten Rucksacks teilen sich nur den Gegenstandstyp v.
Die Fächer des fünften Rucksacks teilen sich nur den Gegenstandstyp t.
Die Fächer des sechsten Rucksacks teilen sich nur Item Type s.
Um die Neuanordnung von Gegenständen zu priorisieren, kann jeder Gegenstandstyp in eine Priorität umgewandelt werden:

Elementtypen a bis z in Kleinbuchstaben haben die Prioritäten 1 bis 26.
Großgeschriebene Elementtypen A bis Z haben die Prioritäten 27 bis 52.
Im obigen Beispiel ist die Priorität des Artikeltyps, der in beiden Fächern jedes Rucksacks erscheint, 16 (p), 38 (L), 42 (P), 22 (v), 20 (t) und 19 (s). ; die Summe davon ist 157.

Suchen Sie den Gegenstandstyp, der in beiden Fächern jedes Rucksacks erscheint. Was ist die Summe der Prioritäten dieser Elementtypen?
#ce


#include <File.au3>
#include <Array.au3>
Local $Input
Local $result=-1
_FileReadToArray("2022_Day-3.txt",$Input,1)
;~ _ArrayDisplay($Input)

Local $Summe=0
Local $ElementArray=[0,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

For $i=1 To $Input[0]
	Local $BagOne=StringLeft($Input[$i],StringLen($Input[$i])/2)
	Local $BagTwo=StringRight($Input[$i],StringLen($Input[$i])/2)
	Local $StringSplitBagOne=StringSplit($BagOne,"")
	Local $StringSplitBagTwo=StringSplit($BagTwo,"")

	For $a=1 To $StringSplitBagOne[0]
		$result=_ArraySearch($StringSplitBagTwo,$StringSplitBagOne[$a],1,0,1)
		If ($result > -1) Then
			$result=$StringSplitBagOne[$a]
			ExitLoop
		EndIf
	Next

	Local $prio=_ArraySearch($ElementArray,$result,1,0,1)

	$Summe+=$prio
Next

MsgBox(0,"Day-3_StarOne",$Summe)  ;7701
ClipPut($Summe)
