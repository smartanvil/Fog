"
Duplicates the item 6 at the stack and push it
"
Class {
	#name : #FogVMDup6,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup6 class >> byteCode [ 
	^'0x85'
]

{ #category : #'as yet unclassified' }
FogVMDup6 class >> expectedPops [ 
	^6
]

{ #category : #'as yet unclassified' }
FogVMDup6 class >> expectedPushes [ 
	^7
]

{ #category : #'as yet unclassified' }
FogVMDup6 class >> mnemonic [
	^ 'DUP6'
]
