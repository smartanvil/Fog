as yet unclassified
visitFunctionCall: aSASTFunctionCall
	aSASTFunctionCall arguments do: [ :s | s accept: self ].
	aSASTFunctionCall function accept: self