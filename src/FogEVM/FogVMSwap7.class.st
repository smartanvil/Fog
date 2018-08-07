"
Exchange 1st and 7 stack items.
"
Class {
	#name : #FogVMSwap7,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMSwap7 class >> byteCode [ 
	^'0x96'
]

{ #category : #'as yet unclassified' }
FogVMSwap7 class >> expectedPops [ 
	^7
]

{ #category : #'as yet unclassified' }
FogVMSwap7 class >> expectedPushes [ 
	^7
]

{ #category : #'as yet unclassified' }
FogVMSwap7 class >> mnemonic [
	^ 'SWAP7'
]
