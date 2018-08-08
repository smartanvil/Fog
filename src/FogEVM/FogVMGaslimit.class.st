"
Get the block's gas limit
"
Class {
	#name : #FogVMGaslimit,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMGaslimit class >> byteCode [
		^'0x45'.
	
]

{ #category : #generated }
FogVMGaslimit class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMGaslimit class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMGaslimit class >> mnemonic [
		^'GASLIMIT'.
	
]
