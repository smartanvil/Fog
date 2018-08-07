"
Simple not operator
"
Class {
	#name : #FogVMIszero,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMIszero class >> byteCode [
		^'0x15'.
	
]

{ #category : #generated }
FogVMIszero class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMIszero class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMIszero class >> mnemonic [
		^'ISZERO'.
	
]
