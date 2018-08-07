"
Message-call into an account
"
Class {
	#name : #FogVMCall,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCall class >> byteCode [
		^'0xf1'.
	
]

{ #category : #generated }
FogVMCall class >> expectedPops [
		^7.
	
]

{ #category : #generated }
FogVMCall class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCall class >> mnemonic [
		^'CALL'.
	
]
