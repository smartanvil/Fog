as yet unclassified
builderInstance
	^ value
		ifNil: [ self error: 'Not value set yet' ]
		ifNotNil: [ value size = 0
				ifTrue: [ self error: 'Not value set yet' ]
				ifFalse: [ (value at: 1) class relatedBuilder new ] ]