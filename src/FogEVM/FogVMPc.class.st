"
Get the value of the program counter prior to the increment 
"
Class {
	#name : #FogVMPc,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMPc class >> byteCode [
		^'0x58'.
	
]

{ #category : #generated }
FogVMPc class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMPc class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMPc class >> mnemonic [
		^'PC'.
	
]
