"
Multiplication operation
"
Class {
	#name : #FogVMMul,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMul class >> byteCode [
		^'0x02'.
	
]

{ #category : #generated }
FogVMMul class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMMul class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMMul class >> mnemonic [
		^'MUL'.
	
]
