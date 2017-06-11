# goodreader
Make url scheme from goodreader work on Mac

Save Script goodreader.scpt as an Application in the script editor


Added The following to the info.plist in the Contents of the package
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
