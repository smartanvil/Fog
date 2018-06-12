access db - contract accounts
privateSignatureFor: aMethodMirror
	^ '0x' , ((connection web3 sha3_256: aMethodMirror signature) copyFrom: 1 to: 8)