contract - remote activation private
encodeArguments: aCollection for: aMethodMirror
	^ aMethodMirror parameters pack: aCollection with: FogHexadecimalPacker new