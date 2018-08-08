"
Halt execution and register account for later deletion
"
Class {
	#name : #FogVMSelfdestruct,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMSelfdestruct class >> byteCode [
		^'0xff'.
	
]

{ #category : #generated }
FogVMSelfdestruct class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMSelfdestruct class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMSelfdestruct class >> mnemonic [
		^'SELFDESTRUCT'.
	
]
