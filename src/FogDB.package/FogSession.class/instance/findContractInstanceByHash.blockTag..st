access db - contract
findContractInstanceByHash: aContractAddress blockTag: aBlockTag
	| code description |
	code := self eth getContractCode: aContractAddress blockTag: aBlockTag.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForBinaryCode: code.
	^ self createContractInstanceFor: description at: aContractAddress