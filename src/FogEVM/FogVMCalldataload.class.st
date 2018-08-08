"
Get input data of current environment
"
Class {
	#name : #FogVMCalldataload,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCalldataload class >> byteCode [
		^'0x35'.
	
]

{ #category : #generated }
FogVMCalldataload class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMCalldataload class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCalldataload class >> mnemonic [
		^'CALLDATALOAD'.
	
]
