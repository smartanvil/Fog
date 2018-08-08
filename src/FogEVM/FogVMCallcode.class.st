"
Message-call into this account with an alternative account's code
"
Class {
	#name : #FogVMCallcode,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCallcode class >> byteCode [
		^'0xf2'.
	
]

{ #category : #generated }
FogVMCallcode class >> expectedPops [
		^7.
	
]

{ #category : #generated }
FogVMCallcode class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCallcode class >> mnemonic [
		^'CALLCODE'.
	
]
