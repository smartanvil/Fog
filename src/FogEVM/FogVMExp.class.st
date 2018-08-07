"
Exponential operation
"
Class {
	#name : #FogVMExp,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMExp class >> byteCode [
		^'0x0a'.
	
]

{ #category : #generated }
FogVMExp class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMExp class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMExp class >> mnemonic [
		^'EXP'.
	
]
