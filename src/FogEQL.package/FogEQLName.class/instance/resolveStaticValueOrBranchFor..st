as yet unclassified
resolveStaticValueOrBranchFor: aFogStreamsContractInstancesBufferArray
	^ (aFogStreamsContractInstancesBufferArray source detect: [ :s | self = s key ]) value