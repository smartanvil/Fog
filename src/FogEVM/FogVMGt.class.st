"
Greater-than comparison
"
Class {
	#name : #FogVMGt,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMGt class >> byteCode [
		^'0x11'.
	
]

{ #category : #generated }
FogVMGt class >> expectedPops [
		^2.
	
]

{ #category : #generated }
FogVMGt class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMGt class >> mnemonic [
		^'GT'.
	
]
