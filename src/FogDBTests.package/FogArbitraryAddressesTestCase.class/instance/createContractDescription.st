as yet unclassified
createContractDescription
	| file |
	file := '/tmp/test-contract.sol' asFileReference.
	file exists
		ifTrue: [ file delete ].
	file writeStream
		nextPutAll: self code;
		flush;
		close.
	^ connection findContractDescriptionForFileReference: file entry