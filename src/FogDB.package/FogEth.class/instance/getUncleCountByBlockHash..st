as yet unclassified
getUncleCountByBlockHash: var1
	^ self send: (api messageGetUncleCountByBlockHash: var1)