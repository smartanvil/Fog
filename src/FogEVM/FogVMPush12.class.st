"
Place 12 byte item on stack
"
Class {
	#name : #FogVMPush12,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush12 class >> byteCode [ 
	^'0x6b'
]

{ #category : #'as yet unclassified' }
FogVMPush12 class >> mnemonic [
	^ 'PUSH12'
]

{ #category : #'as yet unclassified' }
FogVMPush12 >> initialize [ 
		super initialize.
		bytes := 12
]
