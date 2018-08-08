"
Place 6 byte item on stack
"
Class {
	#name : #FogVMPush6,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush6 class >> byteCode [ 
	^'0x65'
]

{ #category : #'as yet unclassified' }
FogVMPush6 class >> mnemonic [
	^ 'PUSH6'
]

{ #category : #'as yet unclassified' }
FogVMPush6 >> initialize [ 
		super initialize.
		bytes := 6
]
