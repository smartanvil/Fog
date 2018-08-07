"
Place 25 byte item on stack
"
Class {
	#name : #FogVMPush25,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush25 class >> byteCode [ 
	^'0x78'
]

{ #category : #'as yet unclassified' }
FogVMPush25 class >> mnemonic [
	^ 'PUSH25'
]

{ #category : #'as yet unclassified' }
FogVMPush25 >> initialize [ 
		super initialize.
		bytes := 25
]
