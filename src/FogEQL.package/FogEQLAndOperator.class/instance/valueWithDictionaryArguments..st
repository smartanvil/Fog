as yet unclassified
valueWithDictionaryArguments: aValue
	^ (left valueWithDictionaryArguments: aValue) and: [ right valueWithDictionaryArguments: aValue ]