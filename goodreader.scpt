on open location this_URL
	--display dialog this_URL
	set this_URL to decodeText(this_URL)
	--display dialog this_URL
	set oldDelims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "gropen://0/"
	set this_URL to item 2 of the text items of this_URL
	set AppleScript's text item delimiters to "?"
	set thePath to "/mnt/mini/Documents/" & item 1 of the text items of this_URL
	--display dialog "I'm doing something with this URL: " & thePath
	set AppleScript's text item delimiters to oldDelims
	set myfile to (thePath as POSIX file)
	--display dialog myfile
	tell application "Finder"
		open myfile
	end tell
end open location

on decodeText(theText)
	set flagA to false
	set flagB to false
	set theTempCharacter to ""
	set theCharacterList to {}
	repeat with theCurrentCharacter in theText
		set theCurrentCharacter to contents of theCurrentCharacter
		if theCurrentCharacter is "%" then
			set flagA to true
		else if flagA is true then
			set theTempCharacter to theCurrentCharacter
			set flagA to false
			set flagB to true
		else if flagB is true then
			set end of theCharacterList to decodeCharacterHexString(("%" & theTempCharacter & theCurrentCharacter) as string)
			set theTempCharacter to ""
			set flagA to false
			set flagB to false
		else
			set end of theCharacterList to theCurrentCharacter
		end if
	end repeat
	return theCharacterList as string
end decodeText

on decodeCharacterHexString(theCharacters)
	copy theCharacters to {theIdentifyingCharacter, theMultiplierCharacter, theRemainderCharacter}
	set theHexList to "123456789ABCDEF"
	if theMultiplierCharacter is in "ABCDEF" then
		set theMultiplierAmount to offset of theMultiplierCharacter in theHexList
	else
		set theMultiplierAmount to theMultiplierCharacter as integer
	end if
	if theRemainderCharacter is in "ABCDEF" then
		set theRemainderAmount to offset of theRemainderCharacter in theHexList
	else
		set theRemainderAmount to theRemainderCharacter as integer
	end if
	set theASCIINumber to (theMultiplierAmount * 16) + theRemainderAmount
	return (ASCII character theASCIINumber)
end decodeCharacterHexString

