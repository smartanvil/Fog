as yet unclassified
encodeMethodCall: aCollection
	^ self signature , (self encodeArguments: aCollection)