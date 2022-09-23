#cs
--- Day 2: I Was Told There Would Be No Math ---
The elves are running low on wrapping paper, and so they need to submit an order for more. They have a list of the dimensions (length l, width w, and height h) of each present, and only want to order exactly as much as they need.

Fortunately, every present is a box (a perfect right rectangular prism), which makes calculating the required wrapping paper for each gift a little easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l. The elves also need a little extra paper for each present: the area of the smallest side.

For example:

A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square feet of wrapping paper plus 6 square feet of slack, for a total of 58 square feet.
A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 square feet of wrapping paper plus 1 square foot of slack, for a total of 43 square feet.
All numbers in the elves' list are in feet. How many total square feet of wrapping paper should they order?

#ce

#include <Array.au3>
#include <File.au3>

Global $Input
_FileReadToArray("2015_Day-2_Input.txt",$Input,1)

Local $DataSplit=""
Local $l,$w,$h,$square,$Dimension1,$Dimension2,$Dimension3,$slack
Local $wrapper=0
Local $Data=""

For $i=1 To $Input[0]

	$Data="Input: " & $Input[$i]
	$DataSplit=StringSplit($Input[$i],"x",2)

	$DataSplit[0]=Number($DataSplit[0])
	$DataSplit[1]=Number($DataSplit[1])
	$DataSplit[2]=Number($DataSplit[2])
	_ArraySort($DataSplit,0)


	$Dimension1=2*$DataSplit[0]*$DataSplit[1]
	$Dimension2=2*$DataSplit[0]*$DataSplit[2]
	$Dimension3=2*$DataSplit[1]*$DataSplit[2]

	$Data=$Data & " - Fläche: lb= " & $Dimension1 & " / bh= " & $Dimension2 & " / hl=" & $Dimension3

	$slack=$DataSplit[0]*$DataSplit[1]
	$square=($Dimension1)+($Dimension2)+($Dimension3)+$slack

	$wrapper=$wrapper+$square

$Data=""
Next

MsgBox(0,"Question-1",$wrapper) ; Lösung: 1586300


