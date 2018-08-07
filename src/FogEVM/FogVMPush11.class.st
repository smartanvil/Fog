"
Place 11 byte item on stack
"
Class {
	#name : #FogVMPush11,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush11 class >> byteCode [ 
	^'0x6a'
]

{ #category : #'as yet unclassified' }
FogVMPush11 class >> mnemonic [
	^ 'PUSH11'
]

{ #category : #'as yet unclassified' }
FogVMPush11 >> initialize [ 
		super initialize.
		bytes := 11
]
