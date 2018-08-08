"
Place 4 byte item on stack
"
Class {
	#name : #FogVMPush4,
	#superclass : #FogVMPush,
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush4 class >> byteCode [ 
	^'0x63'
]

{ #category : #'as yet unclassified' }
FogVMPush4 class >> mnemonic [
	^ 'PUSH4'
]

{ #category : #'as yet unclassified' }
FogVMPush4 >> initialize [ 
		super initialize.
		bytes := 4
]
