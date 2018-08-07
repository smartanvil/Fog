"
Place N bytes item on stack
"
Class {
	#name : #FogVMPush,
	#superclass : #FogEVMInstruction,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'bytes',
		'parameter'
	],
	#category : 'FogEVM-ByteCode'
}

{ #category : #'as yet unclassified' }
FogVMPush class >> byteCode [
	^ 'no-meaning'
]

{ #category : #generated }
FogVMPush class >> expectedPops [
		^0.
	
]

{ #category : #generated }
FogVMPush class >> expectedPushes [
		^1.
	
]

{ #category : #generated }
FogVMPush class >> instance [
	^ self new
]

{ #category : #'as yet unclassified' }
FogVMPush class >> instance0x00 [
	^ self new parameter: '0x00'; yourself 
]

{ #category : #'as yet unclassified' }
FogVMPush class >> instance0x0002 [
	^ self new
		parameter: '0x0002';
		yourself
]

{ #category : #testing }
FogVMPush >> isPush [
	^ true
]

{ #category : #'as yet unclassified' }
FogVMPush >> loadParametersFrom: anHexaStream [
	parameter := '0x' , (anHexaStream next: bytes * 2)
]

{ #category : #'as yet unclassified' }
FogVMPush >> parameter [
	^ parameter
]

{ #category : #'as yet unclassified' }
FogVMPush >> parameter: aString [ 
	parameter := aString
]

{ #category : #printing }
FogVMPush >> printBinaryOn: aStream [
	| stream |
	super printBinaryOn: aStream.
	stream := (parameter copyReplaceAll: '0x' with: '') readStream.
	[ stream atEnd ] whileFalse: [ aStream nextPut: (stream next: 2) asBKNumber ]
]

{ #category : #printing }
FogVMPush >> printHexaOn: aStream [
	super printHexaOn: aStream.
	aStream nextPutAll: (parameter copyReplaceAll: '0x' with: '')
]

{ #category : #printing }
FogVMPush >> printOn: aStream [
	aStream
		nextPutAll: self mnemonic;
		nextPutAll: ' ';
		nextPutAll: parameter 
]

{ #category : #'as yet unclassified' }
FogVMPush >> pushable [
	^ parameter 
]
