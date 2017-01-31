as yet unclassified
getUncleByBlockHash: var1 andIndex: var2
	^ self send: (api messageGetUncleByBlockHash: var1 andIndex: var2)