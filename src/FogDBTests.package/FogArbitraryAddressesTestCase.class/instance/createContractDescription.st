as yet unclassified
createContractDescription
	| file |
	file := '/tmp/test-contract.sol' asFileReference .
	file writeStream
		nextPutAll: self code;
		flush;
		close.
	^ FogCache current contracts add: (FogFileContractDescription loadCode: file entry)