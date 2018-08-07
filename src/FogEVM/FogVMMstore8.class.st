"
Save byte to memory
"
Class {
	#name : #FogVMMstore8,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMstore8 class >> byteCode [
		^'0x53'.
	
]

{ #category : #generated }
FogVMMstore8 class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMMstore8 class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMMstore8 class >> mnemonic [
		^'MSTORE8'.
	
]
