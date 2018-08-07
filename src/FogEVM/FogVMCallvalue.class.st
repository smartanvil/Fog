"
Get deposited value by the instruction/transaction responsible for this execution
"
Class {
	#name : #FogVMCallvalue,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCallvalue class >> byteCode [
		^'0x34'.
	
]

{ #category : #generated }
FogVMCallvalue class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMCallvalue class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCallvalue class >> mnemonic [
		^'CALLVALUE'.
	
]
