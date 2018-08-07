"
Place 24 byte item on stack
"
Class {
	#name : #FogVMPush24,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush24 class >> byteCode [ 
	^'0x77'
]

{ #category : #'as yet unclassified' }
FogVMPush24 class >> mnemonic [
	^ 'PUSH24'
]

{ #category : #'as yet unclassified' }
FogVMPush24 >> initialize [ 
		super initialize.
		bytes := 24
]
