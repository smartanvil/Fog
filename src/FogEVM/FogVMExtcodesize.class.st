"
Get size of an account's code
"
Class {
	#name : #FogVMExtcodesize,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMExtcodesize class >> byteCode [
		^'0x3b'.
	
]

{ #category : #generated }
FogVMExtcodesize class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMExtcodesize class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMExtcodesize class >> mnemonic [
		^'EXTCODESIZE'.
	
]
