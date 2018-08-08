"
Modulo remainder operation
"
Class {
	#name : #FogVMMod,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMod class >> byteCode [
		^'0x06'.
	
]

{ #category : #generated }
FogVMMod class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMMod class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMMod class >> mnemonic [
		^'MOD'.
	
]
