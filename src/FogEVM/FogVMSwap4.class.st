"
Exchange 1st and 4 stack items.
"
Class {
	#name : #FogVMSwap4,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap4 class >> byteCode [ 
	^'0x93'
]

{ #category : #'as yet unclassified' }
FogVMSwap4 class >> expectedPops [ 
	^4
]

{ #category : #'as yet unclassified' }
FogVMSwap4 class >> expectedPushes [ 
	^4
]

{ #category : #'as yet unclassified' }
FogVMSwap4 class >> mnemonic [
	^ 'SWAP4'
]
