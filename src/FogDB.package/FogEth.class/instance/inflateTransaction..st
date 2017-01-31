util
inflateTransaction: aTxDef
	^ FogTransaction detect: [ :t | t privateTransactionHash = (aTxDef at: #hash) ] ifNoneCreate: [ :t | t source: aTxDef ]