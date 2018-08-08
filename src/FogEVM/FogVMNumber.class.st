"
Get the block's number
"
Class {
	#name : #FogVMNumber,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMNumber class >> byteCode [
		^'0x43'.
	
]

{ #category : #generated }
FogVMNumber class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMNumber class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMNumber class >> mnemonic [
		^'NUMBER'.
	
]
