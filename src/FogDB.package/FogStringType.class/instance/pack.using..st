marshaling
pack: aString using: aFogPacker
	| pack size |
	
	" it writes the size if this size is smaller than 64. If not, it writes the location of the content into the stream, where it will write the lenght and the data ."
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