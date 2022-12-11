#cs
--- Tag 11: Affe mittendrin ---
Als Sie sich schließlich auf den Weg flussaufwärts machen, stellen Sie fest, dass Ihr Gepäck viel leichter ist, als Sie es in Erinnerung haben. In diesem Moment fliegt einer der Gegenstände aus Ihrem Rucksack über Sie hinweg. Affen spielen Keep Away mit deinen fehlenden Sachen!

Um Ihre Sachen zurückzubekommen, müssen Sie vorhersagen können, wohin die Affen Ihre Sachen werfen werden. Nach einiger sorgfältiger Beobachtung stellen Sie fest, dass die Affen darauf basieren, wie besorgt Sie über jeden Gegenstand sind.

Sie machen sich einige Notizen (Ihre Rätseleingabe) zu den Gegenständen, die jeder Affe derzeit hat, wie besorgt Sie über diese Gegenstände sind und wie der Affe Entscheidungen basierend auf Ihrem Besorgnisgrad trifft. Zum Beispiel:

Affe 0:
   Ausgangsartikel: 79, 98
   Betrieb: neu = alt * 19
   Test: durch 23 teilbar
     Wenn wahr: Wirf zu Affe 2
     Wenn falsch: Wirf zu Affe 3

Affe 1:
   Ausgangsartikel: 54, 65, 75, 74
   Betrieb: neu = alt + 6
   Test: durch 19 teilbar
     Wenn wahr: Wirf zu Affe 2
     Wenn falsch: Wirf zu Affe 0

Affe 2:
   Ausgangsartikel: 79, 60, 97
   Operation: neu = alt * alt
   Test: durch 13 teilbar
     Wenn wahr: Wirf zu Affe 1
     Wenn falsch: Wirf zu Affe 3

Affe 3:
   Startpositionen: 74
   Betrieb: neu = alt + 3
   Test: durch 17 teilbar
     Wenn wahr: Wirf zu Affe 0
     Wenn falsch: Wirf zu Affe 1
Jeder Affe hat mehrere Eigenschaften:

Startgegenstände listet Ihre Besorgnis für jeden Gegenstand auf, den der Affe gerade hält, in der Reihenfolge, in der sie inspiziert werden.
Die Operation zeigt, wie sich Ihr Besorgnisniveau ändert, wenn dieser Affe einen Gegenstand inspiziert. (Eine Operation wie neu = alt * 5 bedeutet, dass Ihre Besorgnis, nachdem der Affe den Gegenstand inspiziert hat, fünfmal so hoch ist wie Ihre Besorgnis vor der Inspektion.)
Der Test zeigt, wie der Affe anhand Ihres Sorgenniveaus entscheidet, wohin er als nächstes einen Gegenstand wirft.
If true zeigt, was mit einem Item passiert, wenn der Test wahr war.
Wenn falsch zeigt, was mit einem Item passiert, wenn der Test falsch war.
Nachdem jeder Affe einen Gegenstand inspiziert hat, aber bevor er Ihren Besorgnisgrad testet, führt Ihre Erleichterung, dass die Inspektion des Affen den Gegenstand nicht beschädigt hat, dazu, dass Ihr Besorgnisgrad durch drei geteilt und auf die nächste ganze Zahl abgerundet wird.

Die Affen untersuchen und werfen abwechselnd Gegenstände. Wenn ein einzelner Affe an der Reihe ist, inspiziert und wirft er alle Gegenstände, die er hält, einzeln und in der angegebenen Reihenfolge. Affe 0 geht zuerst, dann Affe 1 und so weiter, bis jeder Affe einmal an der Reihe war. Der Vorgang, bei dem jeder Affe einmal an der Reihe ist, wird als Runde bezeichnet.

Wenn ein Affe einem anderen Affen einen Gegenstand zuwirft, kommt der Gegenstand ans Ende der Liste des Empfängeraffen. Ein Affe, der eine Runde ohne Gegenstände beginnt, könnte am Ende viele Gegenstände inspizieren und werfen, wenn er an der Reihe ist. Wenn ein Affe zu Beginn seines Zuges keine Gegenstände hält, endet sein Zug.

Im obigen Beispiel läuft die erste Runde wie folgt ab:

Affe 0:
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 79.
     Das Sorgenniveau wird mit 19 zu 1501 multipliziert.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 500 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 23 teilbar.
     Gegenstand mit Sorgenlevel 500 wird zu Affe 3 geworfen.
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 98.
     Das Sorgenniveau wird mit 19 zu 1862 multipliziert.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 620 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 23 teilbar.
     Gegenstand mit Sorgenlevel 620 wird zu Affe 3 geworfen.
Affe 1:
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 54.
     Sorgenlevel steigt um 6 auf 60.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 20 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 19 teilbar.
     Item mit Sorgenlevel 20 wird Affe 0 zugeworfen.
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 65.
     Sorgenlevel steigt um 6 auf 71.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 23 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 19 teilbar.
     Item mit Sorgenlevel 23 wird Affe 0 zugeworfen.
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 75.
     Sorgenlevel steigt um 6 auf 81.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 27 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 19 teilbar.
     Item mit Sorgenlevel 27 wird Affe 0 zugeworfen.
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 74.
     Sorgenlevel steigt um 6 auf 80.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 26 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 19 teilbar.
     Item mit Sorgenlevel 26 wird Affe 0 zugeworfen.
Affe 2:
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 79.
     Das Sorgenniveau wird mit sich selbst zu 6241 multipliziert.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 2080 geteilt.
     Das aktuelle Sorgenniveau ist durch 13 teilbar.
     Item mit Sorgenlevel 2080 wird zu Affe 1 geworfen.
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 60.
     Das Sorgenniveau wird mit sich selbst auf 3600 multipliziert.
     Affe langweilt sich mit Gegenstand. Das Sorgenniveau wird durch 3 bis 1200 geteilt.
     Das aktuelle Sorgenniveau ist nicht durch 13 teilbar.
     Gegenstand mit Sorgenlevel 1200 wird zu Affe 3 geworfen.
   Affe untersucht einen Gegenstand mit einem Besorgnisgrad von 97.
     Sorge l
#ce


#include <File.au3>
#include <Array.au3>
Global $Input
Global $result=-1
_FileReadToArray("2022_Day-11.txt",$Input,1)
;~ _ArrayDisplay($Input)


For $i=1 To $Input[0]

Next

MsgBox(0,"Day-11_StarOne",$result) ;
ClipPut($result)
