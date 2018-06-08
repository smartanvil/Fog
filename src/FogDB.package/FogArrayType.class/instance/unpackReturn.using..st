marshaling
unpackReturn: aString using: aFogPacker
	| stream ammount |
	stream := aString readStream.
	stream next: 64.
	ammount := aFogPacker unpackUint256: (stream next: 64).
	^ (1 to: ammount)
		collect:
			[ :i | inner unpack: (stream next: inner staticSlotSize * 2) using: aFogPacker ]