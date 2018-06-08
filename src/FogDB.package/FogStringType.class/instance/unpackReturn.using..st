marshaling
unpackReturn: aString using: aFogPacker
	| stream size |
	stream := aString readStream.
	stream next: 64.
	size := (aFogPacker unpackUint256: (stream next: 64)) * 2.
	^ self unpack: (stream next: size) using: aFogPacker