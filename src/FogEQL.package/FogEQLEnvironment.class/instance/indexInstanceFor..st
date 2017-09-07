initialization
indexInstanceFor: aClass
	| index |
	index := indexRegistry at: aClass.
	index isBlock
		ifTrue: [ index := index value.
			indexRegistry at: aClass put: index ].
	^ index