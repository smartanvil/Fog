"
Conditionally alter the program counter
"
Class {
	#name : #FogVMJumpi,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMJumpi class >> byteCode [
		^'0x57'.
	
]

{ #category : #generated }
FogVMJumpi class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMJumpi class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMJumpi class >> mnemonic [
		^'JUMPI'.
	
]
