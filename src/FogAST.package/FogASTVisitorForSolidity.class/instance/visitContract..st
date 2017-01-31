as yet unclassified
visitContract: aSASTContract
	| contract |
	contract := self createContractNode.
	aSASTContract enums collect: self accept thenDo: (self register: contract).
	aSASTContract structs collect: self accept thenDo: (self register: contract).
	aSASTContract events collect: self accept thenDo: (self register: contract).
	aSASTContract variables collect: self accept thenDo: (self register: contract).
	aSASTContract functions collect: self accept thenDo: (self register: contract).
	^ contract 