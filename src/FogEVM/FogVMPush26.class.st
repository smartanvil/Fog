"
Place 26 byte item on stack
"
Class {
	#name : #FogVMPush26,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush26 class >> byteCode [ 
	^'0x79'
]

{ #category : #'as yet unclassified' }
FogVMPush26 class >> mnemonic [
	^ 'PUSH26'
]

{ #category : #'as yet unclassified' }
FogVMPush26 >> initialize [ 
		super initialize.
		bytes := 26
]
