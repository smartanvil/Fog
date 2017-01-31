as yet unclassified
visitEnum: aSASTEnum
	^ self createTypeEnum values: (aSASTEnum values collect: [ :v | v accept: self ])