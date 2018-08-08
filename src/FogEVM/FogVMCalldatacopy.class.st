"
Copy input data in current environment to memory
"
Class {
	#name : #FogVMCalldatacopy,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCalldatacopy class >> byteCode [
		^'0x37'.
	
]

{ #category : #generated }
FogVMCalldatacopy class >> expectedPops [
		^3.
	
]

{ #category : #generated }
FogVMCalldatacopy class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMCalldatacopy class >> mnemonic [
		^'CALLDATACOPY'.
	
]
