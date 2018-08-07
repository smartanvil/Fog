"
Exchange 1st and 1 stack items.
"
Class {
	#name : #FogVMSwap1,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap1 class >> byteCode [ 
	^'0x90'
]

{ #category : #'as yet unclassified' }
FogVMSwap1 class >> expectedPops [ 
	^1
]

{ #category : #'as yet unclassified' }
FogVMSwap1 class >> expectedPushes [ 
	^1
]

{ #category : #'as yet unclassified' }
FogVMSwap1 class >> mnemonic [
	^ 'SWAP1'
]
