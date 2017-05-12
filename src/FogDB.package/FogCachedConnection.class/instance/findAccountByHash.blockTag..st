access db - accounts
findAccountByHash: aString blockTag: aBlockTag
	^  self cache 
		detectAccount: [ :a | a privateAccountHash = aString asAddress ]
		ifNoneCreate: [ super findAccountByHash: aString blockTag: aBlockTag ]