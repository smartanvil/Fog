"
Exchange 1st and 5 stack items.
"
Class {
	#name : #FogVMSwap5,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap5 class >> byteCode [ 
	^'0x94'
]

{ #category : #'as yet unclassified' }
FogVMSwap5 class >> expectedPops [ 
	^5
]

{ #category : #'as yet unclassified' }
FogVMSwap5 class >> expectedPushes [ 
	^5
]

{ #category : #'as yet unclassified' }
FogVMSwap5 class >> mnemonic [
	^ 'SWAP5'
]
