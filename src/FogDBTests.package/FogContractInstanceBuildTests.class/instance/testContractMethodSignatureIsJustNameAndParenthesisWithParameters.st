tests
testContractMethodSignatureIsJustNameAndParenthesisWithParameters
	simpleStorage contract mirror instanceMirror methods
		do: [ :method | 
			self assert: ('(' split: method signature) size equals: 2.
			self assert: (')' split: method signature) size equals: 2.
			self assert: ((')' split: method signature) at: 2) isEmpty ]