"
Addition operation
"
Class {
	#name : #FogVMAdd,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMAdd class >> byteCode [
		^'0x01'.
	
]

{ #category : #generated }
FogVMAdd class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMAdd class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMAdd class >> mnemonic [
		^'ADD'.
	
]
