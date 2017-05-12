as yet unclassified
getBlockByHash: aBlockHash full: aBoolean
	^ self send: (api messageGetBlockByHash: aBlockHash full: aBoolean)