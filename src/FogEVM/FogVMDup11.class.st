"
Duplicates the item 11 at the stack and push it
"
Class {
	#name : #FogVMDup11,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup11 class >> byteCode [ 
	^'0x8a'
]

{ #category : #'as yet unclassified' }
FogVMDup11 class >> expectedPops [ 
	^11
]

{ #category : #'as yet unclassified' }
FogVMDup11 class >> expectedPushes [ 
	^12
]

{ #category : #'as yet unclassified' }
FogVMDup11 class >> mnemonic [
	^ 'DUP11'
]
