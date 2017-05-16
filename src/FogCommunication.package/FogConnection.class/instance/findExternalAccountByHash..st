access db - external accounts
findExternalAccountByHash: aString 
	|acc|
	acc :=  self findAccountByHash: aString blockTag: 'latest'.
	self assert: acc isContract not description: ' External account expected '. 
	^ acc