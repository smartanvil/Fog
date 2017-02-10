pack
packString: aString
	| pack | 
	pack := (ZnUTF8Encoder new encodeString: aString)
		inject: ''
		into: [ :acc :each | acc , each asHeadlessHexa ].
	pack := pack padRightTo: 64 with: $0.
	^ (2 asBKHexa: 63) , '0' , (self packUint256: aString size) , pack