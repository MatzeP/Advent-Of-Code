#cs
--- Tag 2: Schere Stein Papier ---
Die Elfen fangen an, ihr Lager am Strand aufzuschlagen. Um zu entscheiden, welches Zelt dem Snacklager am nächsten kommt, ist bereits ein riesiges Stein-Schere-Papier-Turnier im Gange.

Rock Paper Scissors ist ein Spiel zwischen zwei Spielern. Jedes Spiel enthält viele Runden; In jeder Runde wählen die Spieler gleichzeitig Stein, Papier oder Schere mit einer Handform. Dann wird ein Gewinner für diese Runde ausgewählt: Stein besiegt Schere, Schere besiegt Papier und Papier besiegt Stein. Wenn beide Spieler dieselbe Form wählen, endet die Runde stattdessen unentschieden.

Ein Elf ist dankbar für Ihre Hilfe gestern und gibt Ihnen einen verschlüsselten Strategieleitfaden (Ihre Rätseleingabe), von dem er sagt, dass er Ihnen sicher zum Sieg verhelfen wird. „Die erste Spalte ist das, was dein Gegner spielen wird: A für Stein, B für Papier und C für Schere. Die zweite Spalte –“ Plötzlich wird der Elb weggerufen, um mit jemandes Zelt zu helfen.

Die zweite Spalte, so überlegst du, muss das sein, was du als Antwort spielen solltest: X für Stein, Y für Papier und Z für Schere. Jedes Mal zu gewinnen wäre verdächtig, also müssen die Antworten sorgfältig ausgewählt worden sein.

Der Gewinner des gesamten Turniers ist der Spieler mit der höchsten Punktzahl. Ihre Gesamtpunktzahl ist die Summe Ihrer Punktzahlen für jede Runde. Die Punktzahl für eine einzelne Runde ist die Punktzahl für die von Ihnen gewählte Form (1 für Stein, 2 für Papier und 3 für Schere) plus die Punktzahl für das Ergebnis der Runde (0, wenn Sie verloren haben, 3, wenn die Runde unentschieden war , und 6 wenn du gewonnen hast).

Da Sie nicht sicher sein können, ob der Elf versucht, Ihnen zu helfen oder Sie auszutricksen, sollten Sie die Punktzahl berechnen, die Sie erhalten würden, wenn Sie dem Strategieleitfaden folgen würden.

Nehmen wir zum Beispiel an, Sie hätten den folgenden Strategieleitfaden erhalten:

Ein Y
B X
CZ
Dieser Strategieleitfaden prognostiziert und empfiehlt Folgendes:

In der ersten Runde wählt dein Gegner Rock (A) und du solltest Paper (Y) wählen. Dies endet mit einem Gewinn für Sie mit einer Punktzahl von 8 (2, weil Sie Papier gewählt haben + 6, weil Sie gewonnen haben).
In der zweiten Runde wählt dein Gegner Paper (B) und du solltest Rock (X) wählen. Dies endet für Sie mit einem Verlust von 1 (1 + 0).
Die dritte Runde ist ein Unentschieden, bei dem beide Spieler Schere wählen, was Ihnen eine Punktzahl von 3 + 3 = 6 gibt.
Wenn Sie in diesem Beispiel dem Strategieleitfaden folgen würden, würden Sie eine Gesamtpunktzahl von 15 (8 + 1 + 6) erhalten.

Wie hoch wäre Ihre Gesamtpunktzahl, wenn alles genau nach Ihrem Strategieleitfaden läuft?

--- Zweiter Teil ---
Der Elf hat mit dem Zelt fertiggeholfen und schleicht sich zu dir zurück. „Jedenfalls sagt die zweite Spalte, wie die Runde enden muss: X bedeutet, dass du verlieren musst, Y bedeutet, dass du die Runde unentschieden beenden musst, und Z bedeutet, dass du gewinnen musst. Viel Glück!“

Die Gesamtpunktzahl wird immer noch auf die gleiche Weise berechnet, aber jetzt müssen Sie herausfinden, welche Form Sie wählen müssen, damit die Runde wie angegeben endet. Das obige Beispiel geht jetzt so:

In der ersten Runde wählt dein Gegner Rock (A) und du musst die Runde unentschieden beenden (Y), also wählst du auch Rock. Daraus ergibt sich eine Punktzahl von 1 + 3 = 4.
In der zweiten Runde wählt dein Gegner Papier (B) und du wählst Stein, also verlierst du (X) mit einer Punktzahl von 1 + 0 = 1.
In der dritten Runde besiegst du die Schere deines Gegners mit Rock für eine Punktzahl von 1 + 6 = 7.
Jetzt, da Sie den streng geheimen Strategieleitfaden korrekt entschlüsseln, erhalten Sie eine Gesamtpunktzahl von 12.

Befolgen Sie die Anweisungen des Elfen für die zweite Spalte, wie hoch wäre Ihre Gesamtpunktzahl, wenn alles genau nach Ihrem Strategieleitfaden läuft?
#ce


#include <File.au3>
#include <Array.au3>
Local $Input
Local $result=-1
_FileReadToArray("2022_Day-2.txt",$Input,1)
;~ _ArrayDisplay($Input)

Local $Komibination=0

For $i=1 To $Input[0]

	Switch $Input[$i] ;A-1 B-2 C-3 X-1 Y-2 Z-3 A>C C>B B>A
		Case "A X"
			$Komibination+=3	;3+0 - verloren mit Schere
		Case "A Y"
			$Komibination+=4	;1+3 - ;unentschieden mit Stein
		Case "A Z"
			$Komibination+=8	;2+6 - ;gewonnen mit Papier
		Case "B X"
			$Komibination+=1	;1+0 - ;verloren mit Stein
		Case "B Y"
			$Komibination+=5	;2+3 - ;unentschieden mit Papier
		Case "B Z"
			$Komibination+=9	;3+6 - ;gewonnen mit Schere
		Case "C X"
			$Komibination+=2	;2+0 - ;verloren mit Papier
		Case "C Y"
			$Komibination+=6	;3+3 - ;unentschieden Schere
		Case "C Z"
			$Komibination+=7	;1+6 - ;gewonnen mit Stein
	EndSwitch
Next

MsgBox(0,"Day-2_StarTwo",$Komibination) ;12767
ClipPut($Komibination)
