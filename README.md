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
3. [RCDefaultApp](http://www.rubicode.com/Software/RCDefaultApp/)
