as yet unclassified
messageProtocolVersion
	^ FogMessage new
		method: 'eth_protocolVersion';
		parameters: {};
		yourself