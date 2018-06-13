access db - contract
findContractInstanceByHash: aContractAddress blockNumber: aBlockNumber
	| code description |
	code := self eth getContractCode: aContractAddress blockNumber: aBlockNumber.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForCode: code.
	^ description at: aContractAddress