"
Get size of input data in current environment
"
Class {
	#name : #FogVMCalldatasize,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCalldatasize class >> byteCode [
		^'0x36'.
	
]

{ #category : #generated }
FogVMCalldatasize class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMCalldatasize class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCalldatasize class >> mnemonic [
		^'CALLDATASIZE'.
	
]
