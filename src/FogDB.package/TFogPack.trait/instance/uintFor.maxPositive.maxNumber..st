pack
uintFor: anInt maxPositive: size maxNumber: inverse
	anInt > size
		ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	anInt < size negated
		ifTrue: [ self error: ' Number is not expressed in the given size ' ].
	^ anInt > 0
		ifTrue: [ anInt ]
		ifFalse: [ anInt + inverse ]