access db - contract accounts
findContractAccountByHash: aString blockHash: aHash
	| acc |
	acc := self findAccountByHash: aString blockHash: aHash.
	self assert: acc isContract description: ' Contract account expected '.
	^ acc