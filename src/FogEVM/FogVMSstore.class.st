"
Save word to storage
"
Class {
	#name : #FogVMSstore,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSstore class >> byteCode [
		^'0x55'.
	
]

{ #category : #generated }
FogVMSstore class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSstore class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMSstore class >> mnemonic [
		^'SSTORE'.
	
]
