"
Bitwise NOT operation
"
Class {
	#name : #FogVMNot,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMNot class >> byteCode [
		^'0x19'.
	
]

{ #category : #generated }
FogVMNot class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMNot class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMNot class >> mnemonic [
		^'NOT'.
	
]
