"
Subtraction operation
"
Class {
	#name : #FogVMSub,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSub class >> byteCode [
		^'0x03'.
	
]

{ #category : #generated }
FogVMSub class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSub class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSub class >> mnemonic [
		^'SUB'.
	
]
