"
Place 17 byte item on stack
"
Class {
	#name : #FogVMPush17,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush17 class >> byteCode [ 
	^'0x70'
]

{ #category : #'as yet unclassified' }
FogVMPush17 class >> mnemonic [
	^ 'PUSH17'
]

{ #category : #'as yet unclassified' }
FogVMPush17 >> initialize [ 
		super initialize.
		bytes := 17
]
