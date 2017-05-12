access db - accounts
findAccountByHash: aString blockNumber: aBlockNumber
	| compiledCode hashAccount  |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	compiledCode := self eth getContractCode: hashAccount blockNumber: aBlockNumber.
	^ self createAccountFromCode: compiledCode andHash: hashAccount