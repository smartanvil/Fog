unpack
unpack: aStream with: anOrderedCollectionOfTypeNames
	^ anOrderedCollectionOfTypeNames collect: [ :t | self perform: ('unpack' , t capitalized , ':') asSymbol withArguments: {aStream} ]