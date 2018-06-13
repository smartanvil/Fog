contract - remote activation private
privateEncode: aMethodMirror arguments: aCollection
	^ String
		streamContents: [ :str | 
			str
				nextPutAll: (self privateSignatureFor: aMethodMirror);
				nextPutAll: (self encodeArguments: aCollection for: aMethodMirror) ]