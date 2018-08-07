"
Place 20 byte item on stack
"
Class {
	#name : #FogVMPush20,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush20 class >> byteCode [ 
	^'0x73'
]

{ #category : #'as yet unclassified' }
FogVMPush20 class >> mnemonic [
	^ 'PUSH20'
]

{ #category : #'as yet unclassified' }
FogVMPush20 >> initialize [ 
		super initialize.
		bytes := 20
]
