as yet unclassified
consume: aReadStream using: aFogPacker
	| contentSize |
	contentSize := self isArray
		ifTrue: [ aFogPacker unpackUint256: (aReadStream next: self class sizeOfUint256 * 2) ]
		ifFalse: [ self staticSlotSize ].
	^ self unpack: (aReadStream next: contentSize * 2) using: aFogPacker