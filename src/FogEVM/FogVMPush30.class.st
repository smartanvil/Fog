"
Place 30 byte item on stack
"
Class {
	#name : #FogVMPush30,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush30 class >> byteCode [ 
	^'0x7d'
]

{ #category : #'as yet unclassified' }
FogVMPush30 class >> mnemonic [
	^ 'PUSH30'
]

{ #category : #'as yet unclassified' }
FogVMPush30 >> initialize [ 
		super initialize.
		bytes := 30
]
