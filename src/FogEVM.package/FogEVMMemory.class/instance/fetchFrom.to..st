as yet unclassified
fetchFrom: anHexaAddressFrom to: anHexaAddressTo
	| value |
	value := '' writeStream.
	value nextPutAll: '0x'.
	anHexaAddressFrom asBKNumber to: anHexaAddressTo asBKNumber - 1 do: [ :id | 
		| memoryValue |
		memoryValue := self fetchValue: id asBKHexa.
		value nextPutAll: (memoryValue copyFrom: 3 to: memoryValue size) ].
	^ value contents