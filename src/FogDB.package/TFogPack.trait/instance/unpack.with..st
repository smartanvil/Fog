unpack
unpack: aStream with: anOrderedCollectionOfTypeNames
	(aStream indexOfSubCollection: '0x') > 0
		ifTrue: [ self error: 'headless string was expected ' ].
	^ anOrderedCollectionOfTypeNames
		collect: [ :t | self perform: ('unpack' , t capitalized , ':') asSymbol withArguments: {aStream} ]