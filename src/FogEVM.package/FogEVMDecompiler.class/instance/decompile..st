public
decompile: aFogEVMMnemonicContract
	| mainScope |
	trace := OrderedCollection new.
	stack := Stack new.
	program := aFogEVMMnemonicContract sequence copy.
	scopes := Dictionary new.
	instructionPointer := 1.
	self newScopeWithID: 0.
	mainScope := self scopeID: 0.
	[ self programHasFinished ]
		whileFalse: [ "self haltIf: [ self peekNextNextInstruction isKindOf: FogVMSwap ]."
			i := self fetchNextInstruction.
			trace add: i.
			i accept: self with: nil ].
	self cleanOneReadOneWriteVariables.
	self extractScopes.
"	self cleanOneReadOneWriteVariables"