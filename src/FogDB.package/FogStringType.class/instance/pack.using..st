as yet unclassified
pack: aString using: aFogPacker
	| pack size |
	pack := (ZnUTF8Encoder new encodeString: aString)
		inject: ''
		into: [ :acc :each | acc , each asHeadlessHexa ].
	size := 64 * (pack size // 64)
		+
			(pack size \\ 64 = 0
				ifTrue: [ 0 ]
				ifFalse: [ 64 ]).
	pack := pack padRightTo: size with: $0.
	^ (aFogPacker packUint256: aString size) , pack