"
Halt execution returning output data
"
Class {
	#name : #FogVMReturn,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMReturn class >> byteCode [
		^'0xf3'.
	
]

{ #category : #generated }
FogVMReturn class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMReturn class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMReturn class >> mnemonic [
		^'RETURN'.
	
]

{ #category : #testing }
FogVMReturn >> isFinishStatus [
	^true
]
