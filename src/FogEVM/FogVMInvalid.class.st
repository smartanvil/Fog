"
Designated invalid instruction
"
Class {
	#name : #FogVMInvalid,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMInvalid class >> byteCode [
		^'0xfe'.
	
]

{ #category : #generated }
FogVMInvalid class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMInvalid class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMInvalid class >> mnemonic [
		^'INVALID'.
	
]
