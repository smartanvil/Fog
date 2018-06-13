accessing
at: aKey
	^ dictionary
		at: aKey
		ifAbsentPut: [ session
				decodeStream: (session fetchSlot: (self storageHashFor: aKey) asHeadlessHexa onContract: contractAddress at: blockReference) readStream
				type: type valueType ]