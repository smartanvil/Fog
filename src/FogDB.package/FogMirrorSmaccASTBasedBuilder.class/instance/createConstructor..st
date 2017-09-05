as yet unclassified
createConstructor: aSolFunctionDefinitionNode
	| input parameters |

	input := aSolFunctionDefinitionNode param_list identifierTokens with: aSolFunctionDefinitionNode param_list types collect: [ :name :type | name -> (types at: type) ].
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogConstructorMirror new
		name: #constructor;
		parameters: parameters;
		yourself