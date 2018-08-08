"
Place 8 byte item on stack
"
Class {
	#name : #FogVMPush8,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush8 class >> byteCode [ 
	^'0x67'
]

{ #category : #'as yet unclassified' }
FogVMPush8 class >> mnemonic [
	^ 'PUSH8'
]

{ #category : #'as yet unclassified' }
FogVMPush8 >> initialize [ 
		super initialize.
		bytes := 8
]
