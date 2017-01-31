as yet unclassified
addLiteral: aSASTLiteral
	initialValue
		ifNotNil: [ self error: 'Double initial value assignment!' ]
		ifNil: [ initialValue := aSASTLiteral ]