"
Alter the program counter
"
Class {
	#name : #FogVMJump,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMJump class >> byteCode [
		^'0x56'.
	
]

{ #category : #generated }
FogVMJump class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMJump class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMJump class >> mnemonic [
		^'JUMP'.
	
]

{ #category : #testing }
FogVMJump >> isStrictJump [
	^ true 
]
