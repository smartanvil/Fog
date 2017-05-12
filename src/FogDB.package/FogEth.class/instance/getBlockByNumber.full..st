as yet unclassified
getBlockByNumber: aBlockNumber full: aBoolean
	^ self send: (api messageGetBlockByNumber: aBlockNumber full: aBoolean)