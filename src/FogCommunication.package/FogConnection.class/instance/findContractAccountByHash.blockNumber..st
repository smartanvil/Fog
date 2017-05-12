access db - contract accounts
findContractAccountByHash: aString blockNumber: aBlockNumber
	| acc |
	acc := self findAccountByHash: aString blockNumber: aBlockNumber.
	self assert: acc isContract description: ' Contract account expected '.
	^ acc