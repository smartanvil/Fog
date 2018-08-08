"
Duplicates the item 4 at the stack and push it
"
Class {
	#name : #FogVMDup4,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup4 class >> byteCode [ 
	^'0x83'
]

{ #category : #'as yet unclassified' }
FogVMDup4 class >> expectedPops [ 
	^4
]

{ #category : #'as yet unclassified' }
FogVMDup4 class >> expectedPushes [ 
	^5
]

{ #category : #'as yet unclassified' }
FogVMDup4 class >> mnemonic [
	^ 'DUP4'
]
