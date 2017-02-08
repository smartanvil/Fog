as yet unclassified
createConstructorMirror: entry with: conversor
	| input |
	input := (entry at: #inputs) collect: [ :n | conversor fetchType: (n at: #type) ].
	^ FogConstructorMirror new
		name: #constructor;
		parameters: input;
		yourself