as yet unclassified
createContractDescription
	| file code |
	file := 'test/test-contract.sol' asFileReference.
	file parent exists
		ifFalse: [ file ensureCreateDirectory ].
	file exists
		ifTrue: [ file delete ].
	code := String lf join: self code lines.
	file writeStream
		nextPutAll: code;
		flush;
		close.
	^ session findContractDescriptionForFileReference: file entry