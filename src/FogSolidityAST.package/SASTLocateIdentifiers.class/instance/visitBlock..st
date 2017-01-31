as yet unclassified
visitBlock: aSASTBlock
	aSASTBlock statements do: [ :s | s accept: self ]