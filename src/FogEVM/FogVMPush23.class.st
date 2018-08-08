"
Place 23 byte item on stack
"
Class {
	#name : #FogVMPush23,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush23 class >> byteCode [ 
	^'0x76'
]

{ #category : #'as yet unclassified' }
FogVMPush23 class >> mnemonic [
	^ 'PUSH23'
]

{ #category : #'as yet unclassified' }
FogVMPush23 >> initialize [ 
		super initialize.
		bytes := 23
]
