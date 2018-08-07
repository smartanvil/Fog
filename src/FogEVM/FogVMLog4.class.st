"
Append log record with four topics
"
Class {
	#name : #FogVMLog4,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMLog4 class >> byteCode [
		^'0xa4'.
	
]

{ #category : #generated }
FogVMLog4 class >> expectedPops [
		^6.
	
]

{ #category : #generated }
FogVMLog4 class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMLog4 class >> mnemonic [
		^'LOG4'.
	
]
