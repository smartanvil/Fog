"
Place 27 byte item on stack
"
Class {
	#name : #FogVMPush27,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush27 class >> byteCode [ 
	^'0x7a'
]

{ #category : #'as yet unclassified' }
FogVMPush27 class >> mnemonic [
	^ 'PUSH27'
]

{ #category : #'as yet unclassified' }
FogVMPush27 >> initialize [ 
		super initialize.
		bytes := 27
]
