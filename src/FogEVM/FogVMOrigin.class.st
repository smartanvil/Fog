"
Get execution origination address
"
Class {
	#name : #FogVMOrigin,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMOrigin class >> byteCode [
		^'0x32'.
	
]

{ #category : #generated }
FogVMOrigin class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMOrigin class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMOrigin class >> mnemonic [
		^'ORIGIN'.
	
]
