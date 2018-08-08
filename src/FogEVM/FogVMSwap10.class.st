"
Exchange 1st and 10 stack items.
"
Class {
	#name : #FogVMSwap10,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap10 class >> byteCode [ 
	^'0x99'
]

{ #category : #'as yet unclassified' }
FogVMSwap10 class >> expectedPops [ 
	^10
]

{ #category : #'as yet unclassified' }
FogVMSwap10 class >> expectedPushes [ 
	^10
]

{ #category : #'as yet unclassified' }
FogVMSwap10 class >> mnemonic [
	^ 'SWAP10'
]
