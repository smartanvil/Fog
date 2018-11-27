"
Maps the special case of the array. 
"
Class {
	#name : #FogSolidityArrayLayoutMapping,
	#superclass : #FogSolidityLayoutMapping,
	#instVars : [
		'mapping'
	],
	#category : 'FogDB-Meta-SolidityLayout'
}

{ #category : #initialization }
FogSolidityArrayLayoutMapping >> mapping: aMapping [
	self error: 'implementarrrr'.
]

{ #category : #initialization }
FogSolidityArrayLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	| hash size |
	" Aaaaaa, no habia que mandar aBKNumber no? Que bueno que estas en australia ahora. "
	size := (super using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash) asBKNumber.
	hash := (Keccak hashEncode: (FogBinaryPacker packSlotId: fromSlot)) asBKNumber.
	^ (hash to: hash + size - 1)
		collect: [ :i | (aSession fetchSlot: i asHeadlessHexa onContract: aContractAddress at: aBlockTagNumberOrHash) asHeadlessHexa ]
]
