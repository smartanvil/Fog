"
Place 29 byte item on stack
"
Class {
	#name : #FogVMPush29,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush29 class >> byteCode [ 
	^'0x7c'
]

{ #category : #'as yet unclassified' }
FogVMPush29 class >> mnemonic [
	^ 'PUSH29'
]

{ #category : #'as yet unclassified' }
FogVMPush29 >> initialize [ 
		super initialize.
		bytes := 29
]
