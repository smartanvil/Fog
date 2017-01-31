as yet unclassified
process: abi with: typesAst
	| input output conversor |
	conversor := FogTypeConversor new.
	conversor configure: typesAst.
	methods := abi
		select: [ :e | (e at: #type) = 'function' ]
		thenCollect: [ :e | 
			input := (e at: #inputs) collect: [ :n | conversor fetchType: (n at: #type) ].
			output := (e at: #outputs) collect: [ :n | conversor fetchType: (n at: #type) ].
			FogContractMethodMirror new
				name: (e at: #name);
				parameters: input;
				return: output;
				modifiesState: (e at: #constant) not;
				yourself ]