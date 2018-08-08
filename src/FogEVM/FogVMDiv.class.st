"
Integer division operation
"
Class {
	#name : #FogVMDiv,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMDiv class >> byteCode [
		^'0x04'.
	
]

{ #category : #generated }
FogVMDiv class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMDiv class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMDiv class >> mnemonic [
		^'DIV'.
	
]
