testing
unpack: aString using: aFogPacker
	| decoded |
	decoded := OrderedCollection new.
	1 to: aString size by: 2 do: [ :idx | 
		| code |
		code := ('16r'
			,
				{(aString at: idx).
				(aString at: idx + 1)}) asNumber.
		code = 0
			ifFalse: [ decoded add: code ] ].
	^ ZnUTF8Encoder new decodeBytes: decoded asByteArray