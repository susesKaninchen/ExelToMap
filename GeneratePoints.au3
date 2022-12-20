#include <array.au3>
$citys = ClipGet()
$acitys = StringSplit($citys, @CRLF, 2)
;_ArrayDisplay($acitys)
$paste = ""
$Serch = StringRegExpReplace(StringLower(FileRead("Orte.txt")), "[\s+\\-\\+\\(\\)]","")
;MsgBox(0, "", $Serch)
For $s in $acitys
	if StringLen($s) <2 Then ContinueLoop
	;MsgBox(0, $s, StringRegExpReplace(StringLower($s), "[\s+\\-\\+\\(\\)]", "") & ".+?,\d+\.\d+,\d+\.\d+")
	$t = StringRegExp($Serch, StringRegExpReplace(StringLower($s), "[\s+\\-\\+\\(\\)\d]","") & ".+?(\d+\.\d+),(\d+\.\d+)", 1)
	if @error Then
		MsgBox(0, "Fehler", "Der Ort " & $s & " konnte nicht gefunden werden.")
		ContinueLoop
	EndIf
	;_ArrayDisplay($t)
	;ConsoleWrite($t)
	$paste &= $t[0] & "," & $t[1] & ",red" & @CRLF
Next
MsgBox(0, "Erfolg", "Koordinaten in der Zwischenablage, bitte ")
ShellExecute("https://mobisoftinfotech.com/tools/plot-multiple-points-on-map/")
ClipPut($paste)