as yet unclassified
messageSendRawTransaction: aCodeOrCall
	^ FogMessage new
		method: 'eth_sendRawTransaction';
		parameters: {aCodeOrCall};
		yourself