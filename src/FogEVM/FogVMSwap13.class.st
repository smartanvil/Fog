"
Exchange 1st and 13 stack items.
"
Class {
	#name : #FogVMSwap13,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap13 class >> byteCode [ 
	^'0x9c'
]

{ #category : #'as yet unclassified' }
FogVMSwap13 class >> expectedPops [ 
	^13
]

{ #category : #'as yet unclassified' }
FogVMSwap13 class >> expectedPushes [ 
	^13
]

{ #category : #'as yet unclassified' }
FogVMSwap13 class >> mnemonic [
	^ 'SWAP13'
]
