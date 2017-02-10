as yet unclassified
createConstructorMirror: entry with: conversor
	| input parameters |
	input := (entry at: #inputs) collect: [ :n | conversor fetchType: (n at: #type) ].
	parameters := FogTupleType new
		types: input;
		yourself.
	^ FogConstructorMirror new
		name: #constructor;
		parameters: parameters;
		yourself