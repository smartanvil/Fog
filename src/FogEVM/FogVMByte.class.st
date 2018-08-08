"
Retrieve single byte from word
"
Class {
	#name : #FogVMByte,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMByte class >> byteCode [
		^'0x1a'.
	
]

{ #category : #generated }
FogVMByte class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMByte class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMByte class >> mnemonic [
		^'BYTE'.
	
]
