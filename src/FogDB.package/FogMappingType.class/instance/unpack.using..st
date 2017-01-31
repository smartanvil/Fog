as yet unclassified
unpack: aString using: anETHPacker
	^ 'Mapping is not yet supported'
	"	aString = '0x0000000000000000000000000000000000000000000000000000000000000000'
		ifTrue: [ ^ Dictionary new ]
		ifFalse: [ self error: 'Array unmarshaling is not yet supported' ]"