as yet unclassified
for: aContractInstance and: aHash
	FogCache current accounts
		detect: [ :a | a privateAccountHash = aHash asAddress ]
		ifFound: [ :a | ^ a ]
		ifNone: [  ].
	^ self cachedNew
		contractInstance: aContractInstance;
		hash: aHash asAddress;
		yourself