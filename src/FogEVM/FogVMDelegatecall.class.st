"
Message-call into this account with an alternative account's code, but persisting the current values for it sender and it value
"
Class {
	#name : #FogVMDelegatecall,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMDelegatecall class >> byteCode [
		^'0xf4'.
	
]

{ #category : #generated }
FogVMDelegatecall class >> expectedPops [
		^6.
	
]

{ #category : #generated }
FogVMDelegatecall class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMDelegatecall class >> mnemonic [
		^'DELEGATECALL'.
	
]
