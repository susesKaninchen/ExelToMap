#include <winhttp.au3>
#include <array.au3>

	$sHTML = ClipGet()
	;ConsoleWrite($sHTML)
	$acityLinks = StringRegExp($sHTML, '<td>(.+?)</td>', 3)
	_ArrayDisplay($acityLinks)
for $i = 3 to Ubound($acityLinks) - 1 Step 3
	FileWriteLine("Orte.txt", $acityLinks[$i] & "," & $acityLinks[$i+1] & "," & $acityLinks[$i+2])
	ConsoleWrite($acityLinks[$i] & "," & $acityLinks[$i+1] & "," & $acityLinks[$i+2] & @CRLF)
Next