as yet unclassified
resolve: aBranch for: aFogStreamsContractInstancesBufferArray
	^ (aBranch isFogName or: [ aBranch isEQLMethod ])
		ifTrue: [ aBranch resolveStaticValueOrBranchFor: aFogStreamsContractInstancesBufferArray ]
		ifFalse: [ aBranch ]