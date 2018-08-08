"
Bitwise AND operation
"
Class {
	#name : #FogVMAnd,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMAnd class >> byteCode [
		^'0x16'.
	
]

{ #category : #generated }
FogVMAnd class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMAnd class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMAnd class >> mnemonic [
		^'AND'.
	
]
