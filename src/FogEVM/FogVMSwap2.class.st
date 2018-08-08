"
Exchange 1st and 2 stack items.
"
Class {
	#name : #FogVMSwap2,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSwap2 class >> byteCode [ 
	^'0x91'
]

{ #category : #generated }
FogVMSwap2 class >> expectedPops [ 
	^2
]

{ #category : #generated }
FogVMSwap2 class >> expectedPushes [ 
	^2
]

{ #category : #generated }
FogVMSwap2 class >> mnemonic [
	^ 'SWAP2'
]
