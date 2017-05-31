generated
accept: anInterpreter loadedAt: byteNumber of: anExecutableMemoryReificaiton
	| perform stackSize localMnemonic |
	localMnemonic := self mnemonic.
	(self mnemonic beginsWith: 'PUSH')
		ifTrue: [ localMnemonic := 'PUSH' ].
	(self mnemonic beginsWith: 'DUP')
		ifTrue: [ localMnemonic := 'DUP' ].
	(self mnemonic beginsWith: 'SWAP')
		ifTrue: [ localMnemonic := 'SWAP' ].
	perform := ('visit' , localMnemonic asLowercase capitalized , ':') asSymbol.
	stackSize := anInterpreter stackSize.
	self manageBreakpointFor: anExecutableMemoryReificaiton atMethod: anInterpreter class >> perform.
	anInterpreter perform: perform withArguments: {self}.
	self assert: anInterpreter stackSize = (stackSize - self expectedPops + self expectedPushes)