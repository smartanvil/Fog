accessing
at: aKey
	^ dictionary
		at: aKey
		ifAbsentPut: [ type valueType
				unpackStream: (bind getStorageAt: (self storageHashFor: aKey)) readStream
				using: FogHexadecimalPacker new ]