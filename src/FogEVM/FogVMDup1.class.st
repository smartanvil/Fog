"
Duplicates the item 1 at the stack and push it
"
Class {
	#name : #FogVMDup1,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup1 class >> byteCode [ 
	^'0x80'
]

{ #category : #'as yet unclassified' }
FogVMDup1 class >> expectedPops [ 
	^1
]

{ #category : #'as yet unclassified' }
FogVMDup1 class >> expectedPushes [ 
	^2
]

{ #category : #'as yet unclassified' }
FogVMDup1 class >> mnemonic [
	^ 'DUP1'
]
