"
Exchange 1st and 12 stack items.
"
Class {
	#name : #FogVMSwap12,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap12 class >> byteCode [ 
	^'0x9b'
]

{ #category : #'as yet unclassified' }
FogVMSwap12 class >> expectedPops [ 
	^12
]

{ #category : #'as yet unclassified' }
FogVMSwap12 class >> expectedPushes [ 
	^12
]

{ #category : #'as yet unclassified' }
FogVMSwap12 class >> mnemonic [
	^ 'SWAP12'
]
