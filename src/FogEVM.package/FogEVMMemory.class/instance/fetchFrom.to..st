as yet unclassified
fetchFrom: anHexaAddressFrom to: anHexaAddressTo
	| value |
	value := '' writeStream.
	value nextPutAll: '0x'.
	anHexaAddressFrom asBKNumber to: anHexaAddressTo asBKNumber - 1 do: [ :id | value nextPutAll: ((self fetchValue: id asBKHexa) copyFrom: 3 to: 4) ].
	^ value contents