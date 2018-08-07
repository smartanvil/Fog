"
Duplicates the item 12 at the stack and push it
"
Class {
	#name : #FogVMDup12,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup12 class >> byteCode [ 
	^'0x8b'
]

{ #category : #'as yet unclassified' }
FogVMDup12 class >> expectedPops [ 
	^12
]

{ #category : #'as yet unclassified' }
FogVMDup12 class >> expectedPushes [ 
	^13
]

{ #category : #'as yet unclassified' }
FogVMDup12 class >> mnemonic [
	^ 'DUP12'
]
