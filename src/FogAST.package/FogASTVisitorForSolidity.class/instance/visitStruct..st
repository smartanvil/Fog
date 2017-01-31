as yet unclassified
visitStruct: aSASTStruct
	^ self createStruct
		name: aSASTStruct simpleName;
		fields: (aSASTStruct fields collect: [ :f | f accept: self ]);
		yourself