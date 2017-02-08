as yet unclassified
process: abi with: typesAst
	| conversor |
	conversor := FogTypeConversor new.
	conversor configure: typesAst.
	constructor := self
		createConstructorMirror: (abi detect: [ :e | (e at: #type) = 'constructor' ])
		with: conversor.
	methods := abi
		select: [ :e | (e at: #type) = 'function' ]
		thenCollect: [ :e | self createMethodMirror: e with: conversor ]