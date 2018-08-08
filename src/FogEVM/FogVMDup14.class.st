"
Duplicates the item 14 at the stack and push it
"
Class {
	#name : #FogVMDup14,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup14 class >> byteCode [ 
	^'0x8d'
]

{ #category : #'as yet unclassified' }
FogVMDup14 class >> expectedPops [ 
	^14
]

{ #category : #'as yet unclassified' }
FogVMDup14 class >> expectedPushes [ 
	^15
]

{ #category : #'as yet unclassified' }
FogVMDup14 class >> mnemonic [
	^ 'DUP14'
]
