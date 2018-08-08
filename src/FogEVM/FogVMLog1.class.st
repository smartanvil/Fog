"
Append log record with one topic
"
Class {
	#name : #FogVMLog1,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMLog1 class >> byteCode [
		^'0xa1'.
	
]

{ #category : #generated }
FogVMLog1 class >> expectedPops [
		^3.
	
]

{ #category : #generated }
FogVMLog1 class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMLog1 class >> mnemonic [
		^'LOG1'.
	
]
