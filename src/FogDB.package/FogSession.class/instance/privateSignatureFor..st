contract - remote activation
privateSignatureFor: aMethodMirror
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: '0x';
				nextPutAll: ((connection web3 sha3_256: aMethodMirror signature) copyFrom: 1 to: 8) ]