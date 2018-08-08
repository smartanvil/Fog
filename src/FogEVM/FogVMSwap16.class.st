"
Exchange 1st and 16 stack items.
"
Class {
	#name : #FogVMSwap16,
	#superclass : #FogVMSwap,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSwap16 class >> byteCode [ 
	^'0x9f'
]

{ #category : #generated }
FogVMSwap16 class >> expectedPops [ 
	^16
]

{ #category : #generated }
FogVMSwap16 class >> expectedPushes [ 
	^16
]

{ #category : #generated }
FogVMSwap16 class >> mnemonic [
	^ 'SWAP16'
]
