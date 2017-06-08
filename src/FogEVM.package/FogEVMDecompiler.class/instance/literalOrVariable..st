as yet unclassified
literalOrVariable: anObject
	^ anObject isString
		ifTrue: [ FogEVMLiteral for: anObject ]
		ifFalse: [ (anObject isEVMLiteral or: [ anObject isEVMVariable ])
				ifTrue: [ anObject ]
				ifFalse: [ self halt: 'Should be string!'  ] ]