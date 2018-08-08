"
Modulo multiplication operation
"
Class {
	#name : #FogVMMulmod,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMulmod class >> byteCode [
		^'0x09'.
	
]

{ #category : #generated }
FogVMMulmod class >> expectedPops [
		^3.
	
]

{ #category : #generated }
FogVMMulmod class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMMulmod class >> mnemonic [
		^'MULMOD'.
	
]
