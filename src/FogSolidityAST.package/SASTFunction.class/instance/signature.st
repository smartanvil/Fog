as yet unclassified
signature
	^ (type
		ifNil: [ SASTFunctionType new
				parameters: parameters;
				returns: return;
				yourself ]) name