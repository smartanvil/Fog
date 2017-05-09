as yet unclassified
visitContract: aSASTContract
	aSASTContract variables do: [ :v | v accept: self ].
	aSASTContract functions do: [ :f | f accept: self ].
	aSASTContract enums do: [ :e | e accept: self ]