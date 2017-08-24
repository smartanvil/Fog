as yet unclassified
resolve: aBranch for: aFogStreamsContractInstancesBufferArray
	^ aBranch isString
		ifTrue: [ (aFogStreamsContractInstancesBufferArray detect: [ :s | aBranch beginsWith: s key ]) value ]
		ifFalse: [ aBranch ]