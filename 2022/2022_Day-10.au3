#cs
--- Tag 10: Kathodenstrahlröhre ---
Du vermeidest die Seile, springst in den Fluss und schwimmst ans Ufer.

Die Elfen schreien etwas über ein Wiedersehen mit ihnen flussaufwärts, aber der Fluss ist zu laut, um genau zu sagen, was sie sagen. Sie überqueren die Brücke und verschwinden aus dem Blickfeld.

Situationen wie diese müssen der Grund dafür sein, dass die Elfen es priorisiert haben, das Kommunikationssystem auf Ihrem Handheld-Gerät zum Laufen zu bringen. Sie ziehen es aus Ihrem Rucksack, aber die Wassermenge, die langsam aus einem großen Riss in seinem Sieb abfließt, sagt Ihnen, dass es wahrscheinlich nicht viel sofortigen Nutzen haben wird.

Es sei denn, Sie können einen Ersatz für das Videosystem des Geräts entwerfen! Es scheint eine Art Kathodenstrahlröhrenbildschirm und eine einfache CPU zu sein, die beide von einer präzisen Taktschaltung angetrieben werden. Die Taktschaltung tickt mit einer konstanten Rate; Jeder Tick wird als Zyklus bezeichnet.

Beginnen Sie damit, das von der CPU gesendete Signal herauszufinden. Die CPU hat ein einziges Register, X, das mit dem Wert 1 beginnt. Es unterstützt nur zwei Befehle:

addx V benötigt zwei Zyklen, um abgeschlossen zu werden. Nach zwei Zyklen wird das X-Register um den Wert V erhöht. (V kann negativ sein.)
noop benötigt einen Zyklus, um abgeschlossen zu werden. Es hat keine andere Wirkung.
Die CPU verwendet diese Anweisungen in einem Programm (Ihre Rätseleingabe), um dem Bildschirm irgendwie mitzuteilen, was er zeichnen soll.

Betrachten Sie das folgende kleine Programm:

nein
Zusatz 3
addx -5
Die Ausführung dieses Programms läuft wie folgt ab:

Zu Beginn des ersten Zyklus beginnt die noop-Anweisung mit der Ausführung. Während des ersten Zyklus ist X 1. Nach dem ersten Zyklus beendet der noop-Befehl die Ausführung und tut nichts.
Zu Beginn des zweiten Zyklus beginnt die Anweisung addx 3 mit der Ausführung. Während des zweiten Zyklus ist X immer noch 1.
Während des dritten Zyklus ist X immer noch 1. Nach dem dritten Zyklus beendet der Befehl addx 3 die Ausführung und setzt X auf 4.
Zu Beginn des vierten Zyklus beginnt die Anweisung addx -5 mit der Ausführung. Während des vierten Zyklus ist X immer noch 4.
Während des fünften Zyklus ist X immer noch 4. Nach dem fünften Zyklus beendet der Befehl addx -5 die Ausführung und setzt X auf -1.
Vielleicht können Sie etwas lernen, indem Sie sich während der Ausführung den Wert des X-Registers ansehen. Betrachten Sie zunächst die Signalstärke (die Zyklusnummer multipliziert mit dem Wert des X-Registers) während des 20. Zyklus und alle 40 Zyklen danach (d. h. während des 20., 60., 100., 140., 180. und 220. .

Betrachten Sie zum Beispiel dieses größere Programm:

Zusatz 15
addx -11
Zusatz 6
addx-3
Zusatz 5
addx-1
addx -8
Zusatz 13
Zusatz 4
nein
addx-1
Zusatz 5
addx-1
Zusatz 5
addx-1
Zusatz 5
addx-1
Zusatz 5
addx-1
addx -35
Zusatz 1
Zusatz 24
addx -19
Zusatz 1
Zusatz 16
addx -11
nein
nein
Zusatz 21
addx -15
nein
nein
addx-3
Zusatz 9
Zusatz 1
addx-3
Zusatz 8
Zusatz 1
Zusatz 5
nein
nein
nein
nein
nein
addx -36
nein
Zusatz 1
Zusatz 7
nein
nein
nein
Zusatz 2
Zusatz 6
nein
nein
nein
nein
nein
Zusatz 1
nein
nein
Zusatz 7
Zusatz 1
nein
addx -13
Zusatz 13
Zusatz 7
nein
Zusatz 1
addx -33
nein
nein
nein
Zusatz 2
nein
nein
nein
Zusatz 8
nein
addx-1
Zusatz 2
Zusatz 1
nein
Zusatz 17
addx -9
Zusatz 1
Zusatz 1
addx-3
Zusatz 11
nein
nein
Zusatz 1
nein
Zusatz 1
nein
nein
addx -13
addx -19
Zusatz 1
Zusatz 3
Zusatz 26
addx -30
Zusatz 12
addx-1
Zusatz 3
Zusatz 1
nein
nein
nein
addx -9
Zusatz 18
Zusatz 1
Zusatz 2
nein
nein
Zusatz 9
nein
nein
nein
addx-1
Zusatz 2
addx -37
Zusatz 1
Zusatz 3
nein
Zusatz 15
addx -21
Zusatz 22
addx -6
Zusatz 1
nein
Zusatz 2
Zusatz 1
nein
addx -10
nein
nein
Zusatz 20
Zusatz 1
Zusatz 2
Zusatz 2
addx -6
addx -11
nein
nein
nein
Die interessanten Signalstärken lassen sich wie folgt ermitteln:

Während des 20. Zyklus hat Register X den Wert 21, also ist die Signalstärke 20 * 21 = 420. (Der 20. Zyklus tritt in der Mitte des zweiten Addx -1 auf, also ist der Wert von Register X der Startwert, 1 , plus alle anderen addx-Werte bis zu diesem Punkt: 1 + 15 - 11 + 6 - 3 + 5 - 1 - 8 + 13 + 4 = 21.)
Während des 60. Zyklus hat Register X den Wert 19, also ist die Signalstärke 60 * 19 = 1140.
Während des 100. Zyklus hat Register X den Wert 18, also ist die Signalstärke 100 * 18 = 1800.
Während des 140. Zyklus hat Register X den Wert 21, also ist die Signalstärke 140 * 21 = 2940.
Während des 180. Zyklus hat Register X den Wert 16, also ist die Signalstärke 180 * 16 = 2880.
Während des 220. Zyklus hat Register X den Wert 18, also ist die Signalstärke 220 * 18 = 3960.
Die Summe dieser Signalstärken beträgt 13140.

Ermitteln Sie die Signalstärke während des 20., 60., 100., 140., 180. und 220. Zyklus. Was ist die Summe dieser sechs Signalstärken?
#ce


#include <File.au3>
#include <Array.au3>
Global $Input
Global $result=-1
_FileReadToArray("2022_Day-10.txt",$Input,1)
;~ _ArrayDisplay($Input)

For $i=1 To $Input[0]

Next

MsgBox(0,"Day-10_StarOne",$result) ; falsch 491 (low)
ClipPut($result)
