"
Place 21 byte item on stack
"
Class {
	#name : #FogVMPush21,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush21 class >> byteCode [ 
	^'0x74'
]

{ #category : #'as yet unclassified' }
FogVMPush21 class >> mnemonic [
	^ 'PUSH21'
]

{ #category : #'as yet unclassified' }
FogVMPush21 >> initialize [ 
		super initialize.
		bytes := 21
]
