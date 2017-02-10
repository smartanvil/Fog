pack
pack: aCollection with: aFogPacker
	| staticStream dynamicStream staticSize |
	self assert: aCollection size = types size.
	staticStream := '' writeStream.
	dynamicStream := '' writeStream.
	staticSize := self staticSlotSize.
	types
		with: aCollection
		do: [ :type :value | 
			type isArrayType
				ifTrue: [ staticStream nextPutAll: (aFogPacker packUint256: staticSize + (dynamicStream position / 2)).
					dynamicStream nextPutAll: (type pack: value using: aFogPacker) ]
				ifFalse: [ staticStream nextPutAll: ((type pack: value using: aFogPacker) padLeftTo: 64 with: $0) ] ].
	^ staticStream contents , dynamicStream contents