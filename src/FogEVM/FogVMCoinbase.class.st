"
Get the block's beneficiary address
"
Class {
	#name : #FogVMCoinbase,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCoinbase class >> byteCode [
		^'0x41'.
	
]

{ #category : #generated }
FogVMCoinbase class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMCoinbase class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMCoinbase class >> mnemonic [
		^'COINBASE'.
	
]
