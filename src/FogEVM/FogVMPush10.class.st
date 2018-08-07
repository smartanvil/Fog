"
Place 10 byte item on stack
"
Class {
	#name : #FogVMPush10,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush10 class >> byteCode [ 
	^'0x69'
]

{ #category : #'as yet unclassified' }
FogVMPush10 class >> mnemonic [
	^ 'PUSH10'
]

{ #category : #'as yet unclassified' }
FogVMPush10 >> initialize [ 
		super initialize.
		bytes := 10
]
