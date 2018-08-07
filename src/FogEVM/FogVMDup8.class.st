"
Duplicates the item 8 at the stack and push it
"
Class {
	#name : #FogVMDup8,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup8 class >> byteCode [ 
	^'0x87'
]

{ #category : #'as yet unclassified' }
FogVMDup8 class >> expectedPops [ 
	^8
]

{ #category : #'as yet unclassified' }
FogVMDup8 class >> expectedPushes [ 
	^9
]

{ #category : #'as yet unclassified' }
FogVMDup8 class >> mnemonic [
	^ 'DUP8'
]
