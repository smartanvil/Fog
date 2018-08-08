"
Get price of gas in current environment
"
Class {
	#name : #FogVMGasprice,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMGasprice class >> byteCode [
		^'0x3a'.
	
]

{ #category : #generated }
FogVMGasprice class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMGasprice class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMGasprice class >> mnemonic [
		^'GASPRICE'.
	
]
