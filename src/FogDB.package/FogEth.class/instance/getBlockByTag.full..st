as yet unclassified
getBlockByTag: aTag full: aBoolean
	^ self send: (api messageGetBlockByTag: aTag full: aBoolean)