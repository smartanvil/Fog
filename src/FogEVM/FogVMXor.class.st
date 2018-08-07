"
Bitwise XOR operation
"
Class {
	#name : #FogVMXor,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMXor class >> byteCode [
		^'0x18'.
	
]

{ #category : #generated }
FogVMXor class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMXor class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMXor class >> mnemonic [
		^'XOR'.
	
]
