as yet unclassified
createMethod: aSolFunctionDefinitionNode
	| input output return parameters |
	input := aSolFunctionDefinitionNode parameters parameters collect: [ :p | (p identifier acceptVisitor: self) -> (types at: p type) ].
	output := aSolFunctionDefinitionNode returned_types
		ifNotNil: [ aSolFunctionDefinitionNode returned_types parameters
				collect: [ :p | (p identifier ifNil: [ #return ] ifNotNil: [ :i | i acceptVisitor: self ]) -> (types at: p type) ] ]
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
		name: (aSolFunctionDefinitionNode identifier acceptVisitor: self);
		parameters: parameters;
		return: return;
		modifiesState: aSolFunctionDefinitionNode isConstant not;
		yourself