"
Duplicates the item 5 at the stack and push it
"
Class {
	#name : #FogVMDup5,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup5 class >> byteCode [ 
	^'0x84'
]

{ #category : #'as yet unclassified' }
FogVMDup5 class >> expectedPops [ 
	^5
]

{ #category : #'as yet unclassified' }
FogVMDup5 class >> expectedPushes [ 
	^6
]

{ #category : #'as yet unclassified' }
FogVMDup5 class >> mnemonic [
	^ 'DUP5'
]
