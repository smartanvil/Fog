access db - contract accounts
findContractAccountByHash: aString blockTag: aBlockTag
	| acc |
	acc := self findAccountByHash: aString blockTag: aBlockTag.
	self assert: acc isContract description: ' Contract account expected '.
	^ acc