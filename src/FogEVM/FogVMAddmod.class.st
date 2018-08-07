"
Modulo addition operation
"
Class {
	#name : #FogVMAddmod,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMAddmod class >> byteCode [
		^'0x08'.
	
]

{ #category : #generated }
FogVMAddmod class >> expectedPops [
		^3.
	
]

{ #category : #generated }
FogVMAddmod class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMAddmod class >> mnemonic [
		^'ADDMOD'.
	
]
