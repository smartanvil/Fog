"
Maps the special case of the array. 
"
Class {
	#name : #FogSolidityArrayLayoutMapping,
	#superclass : #FogSolidityLayoutMapping,
	#instVars : [
		'mapping'
	],
	#category : 'FogLive-Meta-SolidityLayout'
}

{ #category : #initialization }
FogSolidityArrayLayoutMapping >> mapping: aMapping [
	self error: 'implementarrrr'.
]

{ #category : #initialization }
FogSolidityArrayLayoutMapping >> using: aSession fetchContentsFrom: aContractAddress at: aBlockTagNumberOrHash [
	| hash size hexa |
	" Aaaaaa, no habia que mandar aBKNumber no? Que bueno que estas en australia ahora. "
	hexa := Hexadecimal new.
	size := (super
		using: aSession
		fetchContentsFrom: aContractAddress
		at: aBlockTagNumberOrHash) read0xHexadecimal.
	hash := (Keccak hashEncode: (FogBinaryPacker packSlotId: fromSlot))
		read0xHexadecimal.
	^ (hash to: hash + size - 1)
		collect: [ :idx | 
			| i |
			i := hexa writeHeadlessHexadecimal: idx.
			hexa
				chopHexadecimalHeaders:
					(aSession
						fetchSlot: i
						onContract: aContractAddress
						at: aBlockTagNumberOrHash) ]
]
