as yet unclassified
getBlockByNumber: aBlockNumber full: aBoolean
	^ FogBlock
		detect: [ :b | b number = aBlockNumber and: [ b full = aBoolean ] ]
		ifNoneCreate: [ :block | 
			block
				source: (self send: (api messageGetBlockByNumber: aBlockNumber full: aBoolean));
				full: aBoolean;
				yourself ]