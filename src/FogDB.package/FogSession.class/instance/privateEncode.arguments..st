contract - remote activation
privateEncode: aMethodMirror arguments: aCollection
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: (self privateSignatureFor: aMethodMirror);
				nextPutAll: (aMethodMirror parameters pack: aCollection with: FogHexadecimalPacker new) ]