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
3. [Map a custom protocol](https://stackoverflow.com/questions/471581/how-to-map-a-custom-protocol-to-an-application-on-the-mac/3704396#3704396)
1. [LinCastor](https://onflapp.wordpress.com/lincastor/)
2. [RCDefaultApp](http://www.rubicode.com/Software/RCDefaultApp/)
