"
Place 3 byte item on stack
"
Class {
	#name : #FogVMPush3,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush3 class >> byteCode [ 
	^'0x62'
]

{ #category : #'as yet unclassified' }
FogVMPush3 class >> mnemonic [
	^ 'PUSH3'
]

{ #category : #'as yet unclassified' }
FogVMPush3 >> initialize [ 
		super initialize.
		bytes := 3
]
