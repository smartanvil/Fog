rpc call
transferEntityFromMessage: aETHMessage
	^ FogTransferEntity new
		message: aETHMessage;
		id: self nextRequestId;
		jsonrpc: self protocolVersion;
		yourself