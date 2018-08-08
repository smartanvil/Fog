"
Place 19 byte item on stack
"
Class {
	#name : #FogVMPush19,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush19 class >> byteCode [ 
	^'0x72'
]

{ #category : #'as yet unclassified' }
FogVMPush19 class >> mnemonic [
	^ 'PUSH19'
]

{ #category : #'as yet unclassified' }
FogVMPush19 >> initialize [ 
		super initialize.
		bytes := 19
]
