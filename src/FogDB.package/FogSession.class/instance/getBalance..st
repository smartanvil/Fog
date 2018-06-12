access db - external accounts
getBalance: anAddress
	^ (connection getBalance: anAddress blockTag: #latest) asBKNumber