as yet unclassified
resolveAccount: aString blockNumber: aBlockNumber
	| compiledCode hashAccount account |
	aString ifNil: [ ^ FogAccount nilAccount ].
	hashAccount := aString asAddress.
	FogAccount instances
		detect: [ :a | a privateAccountHash = hashAccount ]
		ifFound: [ :a | ^ a ]
		ifNone: [  ].
	compiledCode := self eth getContract: hashAccount blockNumber: aBlockNumber.
	account := compiledCode
		ifNotNil: [ FogContractAccount for: compiledCode and: hashAccount ]
		ifNil: [ FogExternalAccount for: hashAccount ].
	^ account