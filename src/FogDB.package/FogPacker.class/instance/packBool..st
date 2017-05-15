pack
packBool: aBool
	aBool = true ifTrue: [ ^ self packUint8: 1 ].
	aBool = false ifTrue: [ ^ self packUint8: 0 ].
	self error: 'Expected boolean value'.
