"
Get balance of the given account
"
Class {
	#name : #FogVMBalance,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMBalance class >> byteCode [
		^'0x31'.
	
]

{ #category : #generated }
FogVMBalance class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMBalance class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMBalance class >> mnemonic [
		^'BALANCE'.
	
]
