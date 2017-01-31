build attribute
buildAttributeLiterals: aCollection for: aSASTPragma
	^ self
		perform: ('buildLiteralAttributeFor' , aCollection first capitalized , ':') asSymbol
		withArguments: {aCollection allButFirst}