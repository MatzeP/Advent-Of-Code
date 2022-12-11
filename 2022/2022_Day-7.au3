#cs
--- Tag 7: Kein Speicherplatz mehr auf dem Gerät ---
Sie können Vögel zwitschern und Regentropfen hören, die auf Blätter treffen, während die Expedition voranschreitet. Gelegentlich können Sie sogar viel lautere Geräusche in der Ferne hören; Wie groß werden die Tiere hier überhaupt?

Das Gerät, das dir die Elfen gegeben haben, hat nicht nur Probleme mit seinem Kommunikationssystem. Sie versuchen, ein Systemupdate auszuführen:

$ system-update --bitte --hübsch-bitte-mit-Zucker obendrauf
Fehler: Kein Speicherplatz mehr auf dem Gerät
Vielleicht können Sie einige Dateien löschen, um Platz für das Update zu schaffen?

Sie durchsuchen das Dateisystem, um die Situation einzuschätzen, und speichern die resultierende Terminalausgabe (Ihre Rätseleingabe). Zum Beispiel:

$ CD /
$ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$cd ein
$ls
dir e
29116 f
2557 gr
62596 h.lst
$cd z
$ls
584 ich
$CD ..
$CD ..
$ cd d
$ls
4060174j
8033020 d.log
5626152 d.ext
7214296 k
Das Dateisystem besteht aus einem Baum von Dateien (einfachen Daten) und Verzeichnissen (die andere Verzeichnisse oder Dateien enthalten können). Das äußerste Verzeichnis heißt /. Sie können im Dateisystem navigieren, sich in Verzeichnisse hinein- oder herausbewegen und den Inhalt des Verzeichnisses auflisten, in dem Sie sich gerade befinden.

Innerhalb der Terminalausgabe sind Zeilen, die mit $ beginnen, Befehle, die Sie ausgeführt haben, ähnlich wie bei einigen modernen Computern:

cd bedeutet Verzeichnis wechseln. Dies ändert, welches Verzeichnis das aktuelle Verzeichnis ist, aber das spezifische Ergebnis hängt vom Argument ab:
cd x bewegt sich in einer Ebene: Es sucht im aktuellen Verzeichnis nach dem Verzeichnis namens x und macht es zum aktuellen Verzeichnis.
cd .. bewegt sich eine Ebene nach oben: Es findet das Verzeichnis, das das aktuelle Verzeichnis enthält, und macht dieses Verzeichnis dann zum aktuellen Verzeichnis.
cd / wechselt das aktuelle Verzeichnis in das äußerste Verzeichnis /.
ls bedeutet Liste. Es gibt alle Dateien und Verzeichnisse aus, die unmittelbar im aktuellen Verzeichnis enthalten sind:
123 abc bedeutet, dass das aktuelle Verzeichnis eine Datei namens abc mit der Größe 123 enthält.
dir xyz bedeutet, dass das aktuelle Verzeichnis ein Verzeichnis namens xyz enthält.
Anhand der Befehle und der Ausgabe im obigen Beispiel können Sie feststellen, dass das Dateisystem visuell so aussieht:

- / (dir)
   - ein (dir)
     - e (dir)
       - i (Datei, Größe=584)
     - f (Datei, Größe=29116)
     - g (Datei, Größe=2557)
     - h.lst (Datei, Größe=62596)
   - b.txt (Datei, Größe=14848514)
   - c.dat (Datei, Größe=8504156)
   - d (dir)
     - j (Datei, Größe=4060174)
     - d.log (Datei, Größe=8033020)
     - d.ext (Datei, Größe=5626152)
     - k (Datei, Größe=7214296)
Hier gibt es vier Verzeichnisse: / (das äußerste Verzeichnis), a und d (die sich in / befinden) und e (das sich in a befindet). Diese Verzeichnisse enthalten auch Dateien unterschiedlicher Größe.

Da die Festplatte voll ist, sollte Ihr erster Schritt wahrscheinlich darin bestehen, Verzeichnisse zu finden, die gute Kandidaten zum Löschen sind. Dazu müssen Sie die Gesamtgröße jedes Verzeichnisses ermitteln. Die Gesamtgröße eines Verzeichnisses ist die Summe der Größen der darin enthaltenen Dateien, direkt oder indirekt. (Verzeichnisse selbst zählen nicht als intrinsisch groß.)

Die Gesamtgrößen der oben genannten Verzeichnisse finden Sie wie folgt:

Die Gesamtgröße des Verzeichnisses e beträgt 584, da es eine einzelne Datei i der Größe 584 und keine anderen Verzeichnisse enthält.
Das Verzeichnis a hat eine Gesamtgröße von 94853, da es die Dateien f (Größe 29116), g (Größe 2557) und h.lst (Größe 62596) sowie indirekt die Datei i enthält (a enthält e, das i enthält).
Verzeichnis d hat eine Gesamtgröße von 24933642.
Als äußerstes Verzeichnis enthält / alle Dateien. Seine Gesamtgröße beträgt 48381165, die Summe der Größe jeder Datei.
Suchen Sie zunächst alle Verzeichnisse mit einer Gesamtgröße von höchstens 100000 und berechnen Sie dann die Summe ihrer Gesamtgrößen. Im obigen Beispiel sind diese Verzeichnisse a und e; die Summe ihrer Gesamtgrößen beträgt 95437 (94853 + 584). (Wie in diesem Beispiel kann dieser Prozess Dateien mehr als einmal zählen!)

Finden Sie alle Verzeichnisse mit einer Gesamtgröße von höchstens 100000. Wie groß ist die Summe der Gesamtgröße dieser Verzeichnisse?
#ce


#include <File.au3>
#include <Array.au3>
Global $Input
Global $result=-1
_FileReadToArray("2022_Day-7.txt",$Input,1)
;~ _ArrayDisplay($Input)
Global $aFolder[0]
Global $aFolderSize[0]
Global $gZeile=0

For $i=1 To $Input[0]
	If ((StringRegExp($Input[$i],"\$\scd\s\w+")) Or (StringRegExp($Input[$i],"\$\scd\s/"))) Then
		Local $FolderToCheck=StringRegExp($Input[$i],"\$\scd\s(.*)",3)
		$result=_ScanFolder($FolderToCheck[0], $i)
		$i=$gZeile
;~ 		MsgBox(0,$i&"/"&$gZeile,$result)
_ArrayDisplay($aFolder)
	EndIf
MsgBox(0,$i&"/"&$gZeile,$result)
Next

MsgBox(0,"Day-7_StarOne",$result) ;
ClipPut($result)


Func _ScanFolder($FolderName,$Zeile)
	Local $Size=0
	While (Not StringRegExp($Input[$Zeile],"\$\scd\s\w+"))
		If StringRegExp($Input[$Zeile],"dir\s\w+") Then
			Local $Folder=StringRegExp($Input[$Zeile],"dir\s(\w+)",3)
			_ArrayAdd($aFolder,$Folder[0])
		ElseIf StringRegExp($Input[$Zeile],"\d+\s\w+") Then
			Local $FolderSize=StringRegExp($Input[$Zeile],"(\d+)\s\w+",3)
			$Size+=Number($FolderSize[0])
			_ArrayAdd($aFolderSize,Number($FolderSize[0]))
		EndIf
		$Zeile+=1
	WEnd
	$gZeile=$Zeile
Return $FolderName & "-" &$Size
EndFunc