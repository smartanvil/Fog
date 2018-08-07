"
Duplicates the item 15 at the stack and push it
"
Class {
	#name : #FogVMDup15,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup15 class >> byteCode [ 
	^'0x8e'
]

{ #category : #'as yet unclassified' }
FogVMDup15 class >> expectedPops [ 
	^15
]

{ #category : #'as yet unclassified' }
FogVMDup15 class >> expectedPushes [ 
	^16
]

{ #category : #'as yet unclassified' }
FogVMDup15 class >> mnemonic [
	^ 'DUP15'
]
