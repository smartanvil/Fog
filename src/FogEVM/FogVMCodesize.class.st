"
Get size of code running in current environment
"
Class {
	#name : #FogVMCodesize,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCodesize class >> byteCode [
		^'0x38'.
	
]

{ #category : #generated }
FogVMCodesize class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMCodesize class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCodesize class >> mnemonic [
		^'CODESIZE'.
	
]
