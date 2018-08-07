"
Duplicates the item 16 at the stack and push it
"
Class {
	#name : #FogVMDup16,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMDup16 class >> byteCode [ 
	^'0x8f'
]

{ #category : #generated }
FogVMDup16 class >> expectedPops [ 
	^16
]

{ #category : #generated }
FogVMDup16 class >> expectedPushes [ 
	^17
]

{ #category : #generated }
FogVMDup16 class >> mnemonic [
	^ 'DUP16'
]
