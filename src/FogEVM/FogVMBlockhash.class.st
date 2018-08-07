"
Get the hash of one of the 256 most recent complete blocks
"
Class {
	#name : #FogVMBlockhash,
	#superclass : #FogEVMInstruction,
	#category : 'FogEVM-ByteCode'
}

{ #category : #generated }
FogVMBlockhash class >> byteCode [
		^'0x40'.
	
]

{ #category : #generated }
FogVMBlockhash class >> expectedPops [
		^1.
	
]

{ #category : #generated }
FogVMBlockhash class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMBlockhash class >> mnemonic [
		^'BLOCKHASH'.
	
]
