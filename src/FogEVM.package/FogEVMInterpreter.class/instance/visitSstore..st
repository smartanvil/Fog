visit - storage
visitSstore: aFogVMSstore
	| storageAddress value |
	storageAddress := stack pop.
	value := stack pop.
	value := (self storageFor: self contractAddress) atStorage: storageAddress put: value