Class {
	#name : #FogSolidityStringLayoutMapping,
	#superclass : #FogSolidityLayoutMapping,
	#category : #'FogDB-Meta-SolidityLayout'
}

{ #category : #'as yet unclassified' }
FogSolidityStringLayoutMapping >> using: aSession extractFrom: aContractAddress at: aBlockTagNumberOrHash asArray: aLength [
	| hash size parts |
	size := aLength / 64 roundUpTo: 1.
	hash := (Keccak hashEncode: (FogBinaryPacker packSlotId: fromSlot)) asBKNumber.
	parts:=  (hash to: hash + size - 1)
		collect: [ :i | (aSession fetchSlot: i asHeadlessHexa onContract: aContractAddress at: aBlockTagNumberOrHash) asHeadlessHexa ].
		^ '' join: parts 
]

{ #category : #'as yet unclassified' }
FogSolidityStringLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	| content stringLength length |
	content := super using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash.
	stringLength := (content reverse readStream upTo: $0) reverse.
	stringLength isEmpty
		ifTrue: [ ^ '' ].
	length := stringLength asBKNumber.
	^ length <= 31
		ifTrue: [ content copyFrom: 1 to: length ]
		ifFalse: [ self
				using: aSession
				extractFrom: aContractAddress
				at: aBlockTagNumberOrHash
				asArray: length ]
]
