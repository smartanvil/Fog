as yet unclassified
setType: aSASTTypeName
	type ifNotNil: [ self error: 'Double type assignation ' ] ifNil: [ type := aSASTTypeName ]