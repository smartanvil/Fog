as yet unclassified
createMethod: aSolFunctionDefinitionNode
	| input output return parameters |
	input := aSolFunctionDefinitionNode param_list identifierTokens with: aSolFunctionDefinitionNode param_list types collect: [ :name :type | name -> (types at: type) ].
	output := aSolFunctionDefinitionNode returned_types
		ifNotNil: [ aSolFunctionDefinitionNode returned_types identifierTokens size = aSolFunctionDefinitionNode returned_types types size
				ifTrue: [ aSolFunctionDefinitionNode returned_types identifierTokens with: aSolFunctionDefinitionNode returned_types types collect: [ :name :type | name -> (types at: type) ] ]
				ifFalse: [ self assert: aSolFunctionDefinitionNode returned_types types size = 1.
					{('return' -> (types at: aSolFunctionDefinitionNode returned_types types first))} ] ]
		ifNil: [ {} ].
	return := output size > 1
		ifTrue: [ FogTupleType new
				types: output;
				yourself ]
		ifFalse: [ output ifEmpty: [ FogTypeEmpty new ] ifNotEmpty: [ (output at: 1) value ] ].
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogMethodMirror new
		name: aSolFunctionDefinitionNode identifierToken value;
		parameters: parameters;
		return: return;
		modifiesState: aSolFunctionDefinitionNode isConstant not;
		yourself