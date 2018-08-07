"
Compute Keccak-256 hash
"
Class {
	#name : #FogVMSha3,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSha3 class >> byteCode [
		^'0x20'.
	
]

{ #category : #generated }
FogVMSha3 class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSha3 class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSha3 class >> mnemonic [
		^'SHA3'.
	
]
