"
Duplicates the item 9 at the stack and push it
"
Class {
	#name : #FogVMDup9,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup9 class >> byteCode [ 
	^'0x88'
]

{ #category : #'as yet unclassified' }
FogVMDup9 class >> expectedPops [ 
	^9
]

{ #category : #'as yet unclassified' }
FogVMDup9 class >> expectedPushes [ 
	^10
]

{ #category : #'as yet unclassified' }
FogVMDup9 class >> mnemonic [
	^ 'DUP9'
]
