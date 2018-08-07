"
Place 13 byte item on stack
"
Class {
	#name : #FogVMPush13,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush13 class >> byteCode [ 
	^'0x6c'
]

{ #category : #'as yet unclassified' }
FogVMPush13 class >> mnemonic [
	^ 'PUSH13'
]

{ #category : #'as yet unclassified' }
FogVMPush13 >> initialize [ 
		super initialize.
		bytes := 13
]
