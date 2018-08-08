"
Place 16 byte item on stack
"
Class {
	#name : #FogVMPush16,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush16 class >> byteCode [ 
	^'0x6f'
]

{ #category : #'as yet unclassified' }
FogVMPush16 class >> mnemonic [
	^ 'PUSH16'
]

{ #category : #'as yet unclassified' }
FogVMPush16 >> initialize [ 
		super initialize.
		bytes := 16
]
