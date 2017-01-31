as yet unclassified
getBalance: var1 blockTag: var2
	^ self send: (api messageGetBalance: var1 blockTag: var2)