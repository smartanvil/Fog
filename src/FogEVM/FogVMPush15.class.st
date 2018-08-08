"
Place 15 byte item on stack
"
Class {
	#name : #FogVMPush15,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush15 class >> byteCode [ 
	^'0x6e'
]

{ #category : #'as yet unclassified' }
FogVMPush15 class >> mnemonic [
	^ 'PUSH15'
]

{ #category : #'as yet unclassified' }
FogVMPush15 >> initialize [ 
		super initialize.
		bytes := 15
]
