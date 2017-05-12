access db - contract
findContractBindByHash: aContractAddress blockTag: aBlockTag
	| code description |
	code := self eth getContractCode: aContractAddress blockTag: aBlockTag.
	code = '0x'
		ifTrue: [ ^ nil ].
	description := self findContractDescriptionForCode: code.
	^ description at: aContractAddress