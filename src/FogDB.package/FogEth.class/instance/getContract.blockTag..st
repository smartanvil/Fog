as yet unclassified
getContract: aContractAddress blockTag: aBlockTag
	| code unknownContract |
	self cache contractInstances
		detect: [ :instance | instance address = aContractAddress asAddress ]
		ifFound: [ :instance | ^ instance ]
		ifNone: [  ].
	code := self
		send: (api messageGetCode: aContractAddress blockTag: aBlockTag).
	code = '0x'
		ifTrue: [ ^ nil ].
	^ self cache contracts
		detect: [ :contract | contract codeMatchesWith: code ]
		ifFound: [ :contract | contract at: aContractAddress ]
		ifNone: [ unknownContract := FogContractDescription cachedNew
				name: 'Unknown Contract';
				runtime: code;
				yourself.
			unknownContract at: aContractAddress ]