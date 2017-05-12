access db - accounts
findAccountByHash: aString blockTag: aBlockTag
	| compiledCode hashAccount  |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	compiledCode := self eth getContractCode: hashAccount blockTag: aBlockTag.
	^ self createAccountFromCode: compiledCode andHash: hashAccount