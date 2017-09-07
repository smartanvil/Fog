as yet unclassified
resolve: aBranch for: aFogStreamsContractInstancesBufferArray
	^ aBranch isFogName
		ifTrue: [ (aFogStreamsContractInstancesBufferArray source
				detect: [ :s | aBranch value = s key ]) value ]
		ifFalse: [ aBranch ]