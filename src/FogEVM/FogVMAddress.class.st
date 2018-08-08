"
Get address of currently executing account
"
Class {
	#name : #FogVMAddress,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMAddress class >> byteCode [
		^'0x30'.
	
]

{ #category : #generated }
FogVMAddress class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMAddress class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMAddress class >> mnemonic [
		^'ADDRESS'.
	
]
