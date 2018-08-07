"
Place 5 byte item on stack
"
Class {
	#name : #FogVMPush5,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush5 class >> byteCode [ 
	^'0x64'
]

{ #category : #'as yet unclassified' }
FogVMPush5 class >> mnemonic [
	^ 'PUSH5'
]

{ #category : #'as yet unclassified' }
FogVMPush5 >> initialize [ 
		super initialize.
		bytes := 5
]
