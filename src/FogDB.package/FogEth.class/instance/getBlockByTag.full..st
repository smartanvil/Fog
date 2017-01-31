as yet unclassified
getBlockByTag: aTag full: aBoolean
	| blockJson |
	blockJson := self send: (api messageGetBlockByTag: aTag full: aBoolean).
	^ FogBlock
		detect: [ :b | b privateBlockHash = (blockJson at: #hash) and: [ b full = aBoolean ] ]
		ifNoneCreate: [ :block | 
			block
				source: blockJson;
				full: aBoolean;
				yourself ]