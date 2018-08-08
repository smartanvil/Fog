"
Mark a valid destination for jumps
"
Class {
	#name : #FogVMJumpdest,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMJumpdest class >> byteCode [
		^'0x5b'.
	
]

{ #category : #generated }
FogVMJumpdest class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMJumpdest class >> expectedPushes [
		^0.
	
]

{ #category : #generated }
FogVMJumpdest class >> mnemonic [
		^'JUMPDEST'.
	
]

{ #category : #testing }
FogVMJumpdest >> isValidJumpDestination [
	^true
]
