as yet unclassified
getBlockByHash: aBlockHash full: aBoolean
	^ FogBlock
		detect: [ :b | b privateBlockHash = aBlockHash and: [ b isFull = aBoolean ] ]
		ifNoneCreate: [ :block | 
			block
				source: (self send: (api messageGetBlockByHash: aBlockHash full: aBoolean));
				full: aBoolean;
				yourself ]