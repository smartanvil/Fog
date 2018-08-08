"
Exchange 1st and 6 stack items.
"
Class {
	#name : #FogVMSwap6,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap6 class >> byteCode [ 
	^'0x95'
]

{ #category : #'as yet unclassified' }
FogVMSwap6 class >> expectedPops [ 
	^6
]

{ #category : #'as yet unclassified' }
FogVMSwap6 class >> expectedPushes [ 
	^6
]

{ #category : #'as yet unclassified' }
FogVMSwap6 class >> mnemonic [
	^ 'SWAP6'
]
