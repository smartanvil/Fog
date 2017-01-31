as yet unclassified
loadKnownAccounts: anArrayOfAssociations
	anArrayOfAssociations
		collect: [ :assoc | 
			self cachedNew
				hash: assoc key;
				name: assoc value;
				yourself ]