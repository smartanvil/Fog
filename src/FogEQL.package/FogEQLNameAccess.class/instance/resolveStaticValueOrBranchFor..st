accessing
resolveStaticValueOrBranchFor: aFogStreamsContractInstancesBufferArray
	^ (aFogStreamsContractInstancesBufferArray source detect: [ :s | value  = s key ]) value