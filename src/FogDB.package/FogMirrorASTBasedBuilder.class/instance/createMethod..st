as yet unclassified
createMethod: aSASTFunction
	| input output return parameters |

	input := aSASTFunction parameters variables collect: [ :v | v name -> (types at: v type) ].
	output := aSASTFunction return variables collect: [ :v | v name -> (types at: v type) ].
	return := output size > 1
		ifTrue: [ FogTupleType new
				types: output;
				yourself ]
		ifFalse: [ output ifEmpty: [ FogTypeEmpty new ] ifNotEmpty: [ (output at: 1) value ] ].
	parameters := FogTupleType new
		types: input;
		yourself.

	^ FogMethodMirror new
		name: aSASTFunction name;
		parameters: parameters;
		return: return;
		modifiesState: aSASTFunction isConstant not;
		yourself