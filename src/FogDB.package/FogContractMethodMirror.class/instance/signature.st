as yet unclassified
signature
	^ signature
		ifNil: [ signature := '0x' , ((self connection web3 sha3_256: self name) copyFrom: 1 to: 8) ]