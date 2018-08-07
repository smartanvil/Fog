"
Get the amount of available gas, including the corresponding reduction 
"
Class {
	#name : #FogVMGas,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMGas class >> byteCode [
		^'0x5a'.
	
]

{ #category : #generated }
FogVMGas class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMGas class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMGas class >> mnemonic [
		^'GAS'.
	
]
