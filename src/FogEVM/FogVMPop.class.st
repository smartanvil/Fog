"
Remove item from stack
"
Class {
	#name : #FogVMPop,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMPop class >> byteCode [
		^'0x50'.
	
]

{ #category : #generated }
FogVMPop class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMPop class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMPop class >> mnemonic [
		^'POP'.
	
]
