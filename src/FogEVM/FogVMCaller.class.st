"
Get caller address
"
Class {
	#name : #FogVMCaller,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCaller class >> byteCode [
		^'0x33'.
	
]

{ #category : #generated }
FogVMCaller class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMCaller class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCaller class >> mnemonic [
		^'CALLER'.
	
]
