as yet unclassified
suicideFunction
	| var |
	var := SASTVariable new setType: (types resolve: 'address').
	^ SASTFunctionType new
		parameters:
			(SASTParameterList new
				addVariableDeclaration: var;
				yourself);
		returns: SASTParameterList new