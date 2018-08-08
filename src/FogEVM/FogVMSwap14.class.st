"
Exchange 1st and 14 stack items.
"
Class {
	#name : #FogVMSwap14,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap14 class >> byteCode [ 
	^'0x9d'
]

{ #category : #'as yet unclassified' }
FogVMSwap14 class >> expectedPops [ 
	^14
]

{ #category : #'as yet unclassified' }
FogVMSwap14 class >> expectedPushes [ 
	^14
]

{ #category : #'as yet unclassified' }
FogVMSwap14 class >> mnemonic [
	^ 'SWAP14'
]
