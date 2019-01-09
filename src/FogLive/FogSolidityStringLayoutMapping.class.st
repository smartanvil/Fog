Class {
	#name : #FogSolidityStringLayoutMapping,
	#superclass : #FogSolidityLayoutMapping,
	#category : #'FogLive-Meta-SolidityLayout'
}

{ #category : #'as yet unclassified' }
FogSolidityStringLayoutMapping >> using: aSession extractFrom: aContractAddress at: aBlockTagNumberOrHash asArray: aLength [
	| hash size parts hexa |
	hexa := Hexadecimal new.
	size := aLength / 64 roundUpTo: 1.
	hash := (Keccak hashEncode: (FogBinaryPacker packSlotId: fromSlot)) read0xHexadecimal.
	parts := (hash to: hash + size - 1)
		collect: [ :idx | 
			| i |
			i := hexa writeHeadlessHexadecimal: idx.
			hexa chopHeaders: (aSession fetchSlot: i onContract: aContractAddress at: aBlockTagNumberOrHash) ].
	^ '' join: parts
]

{ #category : #'as yet unclassified' }
FogSolidityStringLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	| content stringLength length |
	content := super using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash.
	stringLength := (content reverse readStream upTo: $0) reverse.
	stringLength isEmpty
		ifTrue: [ ^ '' ].
	length := stringLength read0xHexadecimal.
	^ length <= 31
		ifTrue: [ content copyFrom: 1 to: length ]
		ifFalse: [ self
				using: aSession
				extractFrom: aContractAddress
				at: aBlockTagNumberOrHash
				asArray: length ]
]
