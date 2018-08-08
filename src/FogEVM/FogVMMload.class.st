"
Load word from memory
"
Class {
	#name : #FogVMMload,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMload class >> byteCode [
		^'0x51'.
	
]

{ #category : #generated }
FogVMMload class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMMload class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMMload class >> mnemonic [
		^'MLOAD'.
	
]
