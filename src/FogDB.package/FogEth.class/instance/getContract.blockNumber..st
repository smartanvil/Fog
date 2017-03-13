as yet unclassified
getContract: aContractAddress blockNumber: aBlockNumber
	| code contract |
	self cache contractInstances detect: [ :instance | instance address = aContractAddress asAddress ] ifFound: [ :instance | ^ instance ] ifNone: [  ].
	code := self send: (api messageGetCode: aContractAddress blockNumber: aBlockNumber).
	code = '0x'
		ifTrue: [ ^ nil ].
	contract := self cache contracts
		detect: [ :ctr | ctr codeMatchesWith: code ]
		ifNone: [ FogContractDescription cachedNew
				name: 'Unknown Contract';
				binary: code;
				yourself ].
	^ contract at: aContractAddress