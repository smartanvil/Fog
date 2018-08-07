"
Signed integer division operation (truncated)
"
Class {
	#name : #FogVMSdiv,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSdiv class >> byteCode [
		^'0x05'.
	
]

{ #category : #generated }
FogVMSdiv class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMSdiv class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMSdiv class >> mnemonic [
		^'SDIV'.
	
]
