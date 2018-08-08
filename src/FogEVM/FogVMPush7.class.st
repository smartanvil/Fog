"
Place 7 byte item on stack
"
Class {
	#name : #FogVMPush7,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush7 class >> byteCode [ 
	^'0x66'
]

{ #category : #'as yet unclassified' }
FogVMPush7 class >> mnemonic [
	^ 'PUSH7'
]

{ #category : #'as yet unclassified' }
FogVMPush7 >> initialize [ 
		super initialize.
		bytes := 7
]
