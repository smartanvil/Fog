"
Less-than comparison
"
Class {
	#name : #FogVMLt,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMLt class >> byteCode [
		^'0x10'.
	
]

{ #category : #generated }
FogVMLt class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMLt class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMLt class >> mnemonic [
		^'LT'.
	
]
