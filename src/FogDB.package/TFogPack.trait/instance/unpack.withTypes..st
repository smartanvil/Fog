unpack
unpack: aString withTypes: aCollection
	^ aCollection collect: [ :t | t unpack: aString using: self ]