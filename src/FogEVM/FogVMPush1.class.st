"
Place 1 byte item on stack
"
Class {
	#name : #FogVMPush1,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMPush1 class >> byteCode [ 
	^'0x60'
]

{ #category : #generated }
FogVMPush1 class >> mnemonic [
	^ 'PUSH1'
]

{ #category : #'as yet unclassified' }
FogVMPush1 >> initialize [ 
		super initialize.
		bytes := 1
]
