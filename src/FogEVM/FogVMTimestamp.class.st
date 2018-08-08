"
Get the block's timestamp
"
Class {
	#name : #FogVMTimestamp,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMTimestamp class >> byteCode [
		^'0x42'.
	
]

{ #category : #generated }
FogVMTimestamp class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMTimestamp class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMTimestamp class >> mnemonic [
		^'TIMESTAMP'.
	
]
