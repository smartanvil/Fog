as yet unclassified
unpackString: aString
	| decoding decoded |
	decoding := aString copyReplaceAll: '0x' with: ''.
	decoded := OrderedCollection new.
	1 to: decoding size by: 2 do: [ :idx | 
		| code |
		code := ('16r'
			,
				{(decoding at: idx).
				(decoding at: idx + 1)}) asNumber.
		code = 0
			ifFalse: [ decoded add: code ] ].
	^ ZnUTF8Encoder new decodeBytes: decoded asByteArray