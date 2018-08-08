"
Place 32 byte item on stack
"
Class {
	#name : #FogVMPush32,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMPush32 class >> byteCode [ 
	^'0x7f'
]

{ #category : #generated }
FogVMPush32 class >> mnemonic [
	^ 'PUSH32'
]

{ #category : #'as yet unclassified' }
FogVMPush32 >> initialize [ 
		super initialize.
		bytes := 32
]
