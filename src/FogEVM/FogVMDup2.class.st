"
Duplicates the item 2 at the stack and push it
"
Class {
	#name : #FogVMDup2,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMDup2 class >> byteCode [ 
	^'0x81'
]

{ #category : #generated }
FogVMDup2 class >> expectedPops [ 
	^2
]

{ #category : #generated }
FogVMDup2 class >> expectedPushes [ 
	^3
]

{ #category : #generated }
FogVMDup2 class >> mnemonic [
	^ 'DUP2'
]
