as yet unclassified
signature
	^ (type
		ifNil: [ SASTFunctionType new
				parameters: parameters;
				returns: self return;
				yourself ]) name