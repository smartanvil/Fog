"
Place 2 byte item on stack
"
Class {
	#name : #FogVMPush2,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMPush2 class >> byteCode [ 
	^'0x61'
]

{ #category : #generated }
FogVMPush2 class >> mnemonic [
	^ 'PUSH2'
]

{ #category : #'as yet unclassified' }
FogVMPush2 >> initialize [ 
		super initialize.
		bytes := 2
]
