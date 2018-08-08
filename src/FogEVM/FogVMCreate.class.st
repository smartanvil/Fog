"
Create a new account with associated code
"
Class {
	#name : #FogVMCreate,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCreate class >> byteCode [
		^'0xf0'.
	
]

{ #category : #generated }
FogVMCreate class >> expectedPops [
		^3.
	
]

{ #category : #generated }
FogVMCreate class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCreate class >> mnemonic [
		^'CREATE'.
	
]
