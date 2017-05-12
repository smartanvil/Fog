accessing
getStorageAt: var1 upTo: var2 blockNumber: var3
	^ self send: (api messageGetStorageAt: var1 upTo: var2 blockNumber: var3)