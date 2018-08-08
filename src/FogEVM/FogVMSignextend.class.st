"
Extend length of twos complement signed integer
"
Class {
	#name : #FogVMSignextend,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSignextend class >> byteCode [
		^'0x0b'.
	
]

{ #category : #generated }
FogVMSignextend class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSignextend class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSignextend class >> mnemonic [
		^'SIGNEXTEND'.
	
]
