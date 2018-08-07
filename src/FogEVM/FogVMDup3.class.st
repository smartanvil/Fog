"
Duplicates the item 3 at the stack and push it
"
Class {
	#name : #FogVMDup3,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup3 class >> byteCode [ 
	^'0x82'
]

{ #category : #'as yet unclassified' }
FogVMDup3 class >> expectedPops [ 
	^3
]

{ #category : #'as yet unclassified' }
FogVMDup3 class >> expectedPushes [ 
	^4
]

{ #category : #'as yet unclassified' }
FogVMDup3 class >> mnemonic [
	^ 'DUP3'
]
