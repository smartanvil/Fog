as yet unclassified
visitMapping: aSASTMapping
	^ self createMapping
		keyType: (aSASTMapping keyType accept: self);
		valueType: (aSASTMapping valueType accept: self);
		yourself