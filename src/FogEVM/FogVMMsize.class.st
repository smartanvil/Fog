"
Get the size of active memory in bytes
"
Class {
	#name : #FogVMMsize,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMsize class >> byteCode [
		^'0x59'.
	
]

{ #category : #generated }
FogVMMsize class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMMsize class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMMsize class >> mnemonic [
		^'MSIZE'.
	
]
