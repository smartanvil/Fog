as yet unclassified
transferEntityFromJsonString: aString
	| entity message |
	entity := (NeoJSONReader on: aString readStream) next.
	message := FogMessage new
		method: (entity at: #method);
		parameters: (entity at: #params);
		yourself.
	^ FogTransferEntity new
		id: (entity at: #id);
		jsonrpc: (entity at: #jsonrpc);
		message: message;
		yourself