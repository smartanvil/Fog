accessing
signature 
	^ signature
		ifNil: [ signature := '0x' , ((self connection web3 sha3_256: self signatureName) copyFrom: 1 to: 8) ]