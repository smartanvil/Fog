creation
createAccountFromCode: compiledCode andHash: hashAccount
	^ compiledCode
		ifNotNil: [ self createContractAccountFor: compiledCode and: hashAccount ]
		ifNil: [ self createExternalAccountFor: hashAccount ]