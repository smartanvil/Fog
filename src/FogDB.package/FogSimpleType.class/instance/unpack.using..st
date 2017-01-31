as yet unclassified
unpack: aString using: anETHPacker
	^ (anETHPacker unpack: aString with: {name}) at: 1