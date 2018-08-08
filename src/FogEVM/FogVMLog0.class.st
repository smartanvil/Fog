"
Append log record with no topics
"
Class {
	#name : #FogVMLog0,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMLog0 class >> byteCode [
		^'0xa0'.
	
]

{ #category : #generated }
FogVMLog0 class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMLog0 class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMLog0 class >> mnemonic [
		^'LOG0'.
	
]
