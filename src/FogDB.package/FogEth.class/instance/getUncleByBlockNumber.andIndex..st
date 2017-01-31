as yet unclassified
getUncleByBlockNumber: var1 andIndex: var2
	^ self send: (api messageGetUncleByBlockNumber: var1 andIndex: var2)