"
Copy an account's code to memory
"
Class {
	#name : #FogVMExtcodecopy,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMExtcodecopy class >> byteCode [
		^'0x3c'.
	
]

{ #category : #generated }
FogVMExtcodecopy class >> expectedPops [
		^4.
	
]

{ #category : #generated }
FogVMExtcodecopy class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMExtcodecopy class >> mnemonic [
		^'EXTCODECOPY'.
	
]
