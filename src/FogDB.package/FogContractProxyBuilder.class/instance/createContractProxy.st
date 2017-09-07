build
createContractProxy
	^ Smalltalk
		at: self buildClassName asSymbol
		ifAbsent: [ self createClassUsing: self createTrait ]