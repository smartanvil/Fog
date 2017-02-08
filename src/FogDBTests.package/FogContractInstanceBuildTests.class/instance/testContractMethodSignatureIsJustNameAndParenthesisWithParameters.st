tests
testContractMethodSignatureIsJustNameAndParenthesisWithParameters
	simpleStorage contract mirror instanceMirror methods
		do: [ :method | 
			self assert: ('(' split: method signatureName) size equals: 2.
			self assert: (')' split: method signatureName) size equals: 2.
			self assert: ((')' split: method signatureName) at: 2) isEmpty ]