as yet unclassified
visitContract: aSASTContract
	contexts push: aSASTContract.
	aSASTContract functions do: [ :f | f accept: self ].
	contexts pop.