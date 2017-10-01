as yet unclassified
extract: aCollection
	^ (left extract: aCollection) perform: operationSymbol withArguments: {(right extract: aCollection)}