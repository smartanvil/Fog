Class {
	#name : #FogVMInvert,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMInvert class >> byteCode [
		^'0xfd'.
	
]

{ #category : #generated }
FogVMInvert class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMInvert class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMInvert class >> mnemonic [
		^'INVERT'.
	
]
