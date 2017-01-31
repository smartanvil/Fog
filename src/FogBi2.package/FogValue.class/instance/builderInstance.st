accessing
builderInstance
	^ value
		ifNil: [ self error: 'Not value set yet' ]
		ifNotNil: [ value class relatedBuilder new ]