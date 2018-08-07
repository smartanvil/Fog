"
Exchange 1st and 11 stack items.
"
Class {
	#name : #FogVMSwap11,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap11 class >> byteCode [ 
	^'0x9a'
]

{ #category : #'as yet unclassified' }
FogVMSwap11 class >> expectedPops [ 
	^11
]

{ #category : #'as yet unclassified' }
FogVMSwap11 class >> expectedPushes [ 
	^11
]

{ #category : #'as yet unclassified' }
FogVMSwap11 class >> mnemonic [
	^ 'SWAP11'
]
