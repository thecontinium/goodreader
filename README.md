# goodreader
Make url scheme from goodreader work on Mac

1. Save Script goodreader.scpt as an Application in the script editor

2. Add The following to the info.plist in the Contents of the package or use info.plist in this repository

``` plist
<key>CFBundleURLTypes</key>
	<array>
		<dict>
			<key>CFBundleURLName</key>
			<string>goddreader handler</string>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>gropen</string>
			</array>
		</dict>
	</array>
```

## Useful Tools/Links
1. [Map a custom protocol](https://stackoverflow.com/questions/471581/how-to-map-a-custom-protocol-to-an-application-on-the-mac/3704396#3704396)
2. [LinCastor](https://onflapp.wordpress.com/lincastor/)

GoodReader
``` applescript
on handle_url(args)
	-- display dialog "handle url: " & |URL| of args
	set source to ("/mnt/mini/Documents" & (|URL_PATH| of args))
	set myfile to (source as POSIX file)
	-- display dialog "/mnt/mini/Documents" & |URL_PATH| of args
	-- display dialog myfile
	tell application "Finder"
		--open POSIX file "/mnt/mini/Documents/one. file.pdf"
		open myfile
	end tell
	return 1
end handle_url
```
OneWriter
``` applescript
on handle_url(args)
	set oldDelims to AppleScript's text item delimiters
	set AppleScript's text item delimiters to "/"
	set thisFile to item -1 of the text items of |URL_QUERY_PATH| of args
	set AppleScript's text item delimiters to "."
	set thisFile to item 1 of the text items of thisFile
	--display dialog "nvalt://" & thisFile
	tell application "nvALT"
		activate
		open location "nvalt://" & thisFile
	end tell
	return 1
end handle_url
```

``` applescript
on handle_url(args)
	set iCloudFolder to |URL_QUERY_FOLDER| of args
	set iCloudName to |URL_QUERY_NAME| of args & ".mindnode"
	set pathToiCloud to (path to library folder from user domain as rich text) & "Mobile Documents:W6L39UYL6Z~com~mindnode~"
	tell application "MindNode"
		activate
		set theApp to its name
		set iCloudFile to (pathToiCloud & theApp & ":Documents:" & iCloudFolder & ":" & iCloudName)
		--display dialog iCloudFile
		open file iCloudFile
	end tell
	return 1
end handle_url
```
3. [RCDefaultApp](http://www.rubicode.com/Software/RCDefaultApp/)
