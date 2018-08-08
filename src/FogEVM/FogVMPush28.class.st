"
Place 28 byte item on stack
"
Class {
	#name : #FogVMPush28,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush28 class >> byteCode [ 
	^'0x7b'
]

{ #category : #'as yet unclassified' }
FogVMPush28 class >> mnemonic [
	^ 'PUSH28'
]

{ #category : #'as yet unclassified' }
FogVMPush28 >> initialize [ 
		super initialize.
		bytes := 28
]
