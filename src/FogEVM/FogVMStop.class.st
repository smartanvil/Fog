"
Halts execution
"
Class {
	#name : #FogVMStop,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMStop class >> byteCode [
		^'0x00'.
	
]

{ #category : #generated }
FogVMStop class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMStop class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMStop class >> mnemonic [
		^'STOP'.
	
]

{ #category : #testing }
FogVMStop >> isFinishStatus [
	^ true
]
