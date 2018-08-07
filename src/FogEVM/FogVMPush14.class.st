"
Place 14 byte item on stack
"
Class {
	#name : #FogVMPush14,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush14 class >> byteCode [ 
	^'0x6d'
]

{ #category : #'as yet unclassified' }
FogVMPush14 class >> mnemonic [
	^ 'PUSH14'
]

{ #category : #'as yet unclassified' }
FogVMPush14 >> initialize [ 
		super initialize.
		bytes := 14
]
