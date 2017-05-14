as yet unclassified
createConstructor: aSASTFunction
	| input parameters |
	input := aSASTFunction parameters variables collect: [ :v | v name -> (types at: v type) ].
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogConstructorMirror new
		name: #constructor;
		parameters: parameters;
		yourself