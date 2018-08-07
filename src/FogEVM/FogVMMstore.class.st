"
Save word to memory
"
Class {
	#name : #FogVMMstore,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMMstore class >> byteCode [
		^'0x52'.
	
]

{ #category : #generated }
FogVMMstore class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMMstore class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMMstore class >> mnemonic [
		^'MSTORE'.
	
]
