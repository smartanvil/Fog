"
Load word from storage
"
Class {
	#name : #FogVMSload,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSload class >> byteCode [
		^'0x54'.
	
]

{ #category : #generated }
FogVMSload class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMSload class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSload class >> mnemonic [
		^'SLOAD'.
	
]
