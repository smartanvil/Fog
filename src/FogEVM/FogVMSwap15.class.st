"
Exchange 1st and 15 stack items.
"
Class {
	#name : #FogVMSwap15,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap15 class >> byteCode [ 
	^'0x9e'
]

{ #category : #'as yet unclassified' }
FogVMSwap15 class >> expectedPops [ 
	^15
]

{ #category : #'as yet unclassified' }
FogVMSwap15 class >> expectedPushes [ 
	^15
]

{ #category : #'as yet unclassified' }
FogVMSwap15 class >> mnemonic [
	^ 'SWAP15'
]
