"
Bitwise OR operation
"
Class {
	#name : #FogVMOr,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMOr class >> byteCode [
		^'0x17'.
	
]

{ #category : #generated }
FogVMOr class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMOr class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMOr class >> mnemonic [
		^'OR'.
	
]
