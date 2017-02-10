as yet unclassified
pack: aCollection using: aFogPacker
	| pack size |
	pack := aCollection inject: '' into: [ :acc :each | acc , (inner pack: each using: aFogPacker) ].
	size := 64 * (pack size // 64)
		+
			(pack size \\ 64 = 0
				ifTrue: [ 0 ]
				ifFalse: [ 64 ]).
	pack := pack padRightTo: size with: $0.
	^ (aFogPacker packUint256: aCollection size) , pack