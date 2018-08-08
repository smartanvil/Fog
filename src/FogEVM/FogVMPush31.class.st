"
Place 31 byte item on stack
"
Class {
	#name : #FogVMPush31,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush31 class >> byteCode [ 
	^'0x7e'
]

{ #category : #'as yet unclassified' }
FogVMPush31 class >> mnemonic [
	^ 'PUSH31'
]

{ #category : #'as yet unclassified' }
FogVMPush31 >> initialize [ 
		super initialize.
		bytes := 31
]
