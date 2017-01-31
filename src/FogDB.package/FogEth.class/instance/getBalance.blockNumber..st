as yet unclassified
getBalance: var1 blockNumber: var2
	^ self send: (api messageGetBalance: var1 blockNumber: var2)