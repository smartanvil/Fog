"
Duplicates the item 7 at the stack and push it
"
Class {
	#name : #FogVMDup7,
	#superclass : #FogVMDup,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMDup7 class >> byteCode [ 
	^'0x86'
]

{ #category : #'as yet unclassified' }
FogVMDup7 class >> expectedPops [ 
	^7
]

{ #category : #'as yet unclassified' }
FogVMDup7 class >> expectedPushes [ 
	^8
]

{ #category : #'as yet unclassified' }
FogVMDup7 class >> mnemonic [
	^ 'DUP7'
]
