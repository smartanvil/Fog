"
Signed modulo remainder operation
"
Class {
	#name : #FogVMSmod,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSmod class >> byteCode [
		^'0x07'.
	
]

{ #category : #generated }
FogVMSmod class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSmod class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSmod class >> mnemonic [
		^'SMOD'.
	
]
