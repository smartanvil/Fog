as yet unclassified
pushFunctionType
	| varpush returnpush |
	varpush := SASTVariable new setType: self innerType.
	returnpush := SASTVariable new setType: self pushReturnType.
	^ SASTFunctionType new
		parameters:
			(SASTParameterList new
				addVariableDeclaration: varpush;
				yourself);
		returns:
			(SASTParameterList new
				addVariableDeclaration: returnpush;
				yourself)