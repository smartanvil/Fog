"
Get the block's difficulty
"
Class {
	#name : #FogVMDifficulty,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMDifficulty class >> byteCode [
		^'0x44'.
	
]

{ #category : #generated }
FogVMDifficulty class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMDifficulty class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMDifficulty class >> mnemonic [
		^'DIFFICULTY'.
	
]
