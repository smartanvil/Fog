"
Exchange 1st and 8 stack items.
"
Class {
	#name : #FogVMSwap8,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap8 class >> byteCode [ 
	^'0x97'
]

{ #category : #'as yet unclassified' }
FogVMSwap8 class >> expectedPops [ 
	^8
]

{ #category : #'as yet unclassified' }
FogVMSwap8 class >> expectedPushes [ 
	^8
]

{ #category : #'as yet unclassified' }
FogVMSwap8 class >> mnemonic [
	^ 'SWAP8'
]
