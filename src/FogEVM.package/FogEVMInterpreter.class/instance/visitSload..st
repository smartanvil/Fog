visiting
visitSload: aFogVMSload 
	| storageAddress value | 
	storageAddress := stack pop.
	value := (self storageFor: self contractAddress) getStorageAt: storageAddress. 
	stack push: value. 