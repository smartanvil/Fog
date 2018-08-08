"
Place 9 byte item on stack
"
Class {
	#name : #FogVMPush9,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush9 class >> byteCode [ 
	^'0x68'
]

{ #category : #'as yet unclassified' }
FogVMPush9 class >> mnemonic [
	^ 'PUSH9'
]

{ #category : #'as yet unclassified' }
FogVMPush9 >> initialize [ 
		super initialize.
		bytes := 9
]
