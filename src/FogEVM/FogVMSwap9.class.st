"
Exchange 1st and 9 stack items.
"
Class {
	#name : #FogVMSwap9,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap9 class >> byteCode [ 
	^'0x98'
]

{ #category : #'as yet unclassified' }
FogVMSwap9 class >> expectedPops [ 
	^9
]

{ #category : #'as yet unclassified' }
FogVMSwap9 class >> expectedPushes [ 
	^9
]

{ #category : #'as yet unclassified' }
FogVMSwap9 class >> mnemonic [
	^ 'SWAP9'
]
