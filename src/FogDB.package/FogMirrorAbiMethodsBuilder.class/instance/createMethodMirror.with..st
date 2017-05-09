as yet unclassified
createMethodMirror: entry with: conversor
	| input output return parameters |
	input := (entry at: #inputs) collect: [ :n | conversor fetchType: (n at: #type) ].
	output := (entry at: #outputs) collect: [ :n | conversor fetchType: (n at: #type) ].
	return := output size > 1
		ifTrue: [ FogTupleType new
				types: output;
				yourself ]
		ifFalse: [ output ifEmpty: [ FogTypeEmpty new ] ifNotEmpty: [ output at: 1 ] ].
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogMethodMirror new
		name: (entry at: #name);
		parameters: parameters;
		return: return;
		modifiesState: (entry at: #constant) not;
		yourself