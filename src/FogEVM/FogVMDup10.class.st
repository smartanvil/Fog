"
Duplicates the item 10 at the stack and push it
"
Class {
	#name : #FogVMDup10,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup10 class >> byteCode [ 
	^'0x89'
]

{ #category : #'as yet unclassified' }
FogVMDup10 class >> expectedPops [ 
	^10
]

{ #category : #'as yet unclassified' }
FogVMDup10 class >> expectedPushes [ 
	^11
]

{ #category : #'as yet unclassified' }
FogVMDup10 class >> mnemonic [
	^ 'DUP10'
]
