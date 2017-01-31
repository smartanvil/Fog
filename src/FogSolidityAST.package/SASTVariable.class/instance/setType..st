as yet unclassified
setType: aSASTTypeName
	typeName
		ifNotNil: [ self error: 'Double type assignation ' ]
		ifNil: [ typeName := aSASTTypeName ]