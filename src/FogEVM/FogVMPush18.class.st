"
Place 18 byte item on stack
"
Class {
	#name : #FogVMPush18,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush18 class >> byteCode [ 
	^'0x71'
]

{ #category : #'as yet unclassified' }
FogVMPush18 class >> mnemonic [
	^ 'PUSH18'
]

{ #category : #'as yet unclassified' }
FogVMPush18 >> initialize [ 
		super initialize.
		bytes := 18
]
