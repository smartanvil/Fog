accessing
at: aKey
	^ type valueType
		unpackStream: (bind getStorageAt: (self storageHashFor: aKey)) readStream
		using: FogPacker new