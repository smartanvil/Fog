"
Signed greater-than comparison
"
Class {
	#name : #FogVMSgt,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSgt class >> byteCode [
		^'0x13'.
	
]

{ #category : #generated }
FogVMSgt class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSgt class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSgt class >> mnemonic [
		^'SGT'.
	
]
