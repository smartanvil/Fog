"
Copy code running in current environment to memory
"
Class {
	#name : #FogVMCodecopy,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMCodecopy class >> byteCode [
		^'0x39'.
	
]

{ #category : #generated }
FogVMCodecopy class >> expectedPops [
		^3.
	
]

{ #category : #generated }
FogVMCodecopy class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMCodecopy class >> mnemonic [
		^'CODECOPY'.
	
]

{ #category : #testing }
FogVMCodecopy >> isCopyCode [
	^ true
]
