"
Signed less-than comparison
"
Class {
	#name : #FogVMSlt,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSlt class >> byteCode [
		^'0x12'.
	
]

{ #category : #generated }
FogVMSlt class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSlt class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSlt class >> mnemonic [
		^'SLT'.
	
]
