"
Duplicates the item 13 at the stack and push it
"
Class {
	#name : #FogVMDup13,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup13 class >> byteCode [ 
	^'0x8c'
]

{ #category : #'as yet unclassified' }
FogVMDup13 class >> expectedPops [ 
	^13
]

{ #category : #'as yet unclassified' }
FogVMDup13 class >> expectedPushes [ 
	^14
]

{ #category : #'as yet unclassified' }
FogVMDup13 class >> mnemonic [
	^ 'DUP13'
]
