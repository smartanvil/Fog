"
Exchange 1st and 3 stack items.
"
Class {
	#name : #FogVMSwap3,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap3 class >> byteCode [ 
	^'0x92'
]

{ #category : #'as yet unclassified' }
FogVMSwap3 class >> expectedPops [ 
	^3
]

{ #category : #'as yet unclassified' }
FogVMSwap3 class >> expectedPushes [ 
	^3
]

{ #category : #'as yet unclassified' }
FogVMSwap3 class >> mnemonic [
	^ 'SWAP3'
]
