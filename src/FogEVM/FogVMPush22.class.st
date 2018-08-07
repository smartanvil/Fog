"
Place 22 byte item on stack
"
Class {
	#name : #FogVMPush22,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush22 class >> byteCode [ 
	^'0x75'
]

{ #category : #'as yet unclassified' }
FogVMPush22 class >> mnemonic [
	^ 'PUSH22'
]

{ #category : #'as yet unclassified' }
FogVMPush22 >> initialize [ 
		super initialize.
		bytes := 22
]
