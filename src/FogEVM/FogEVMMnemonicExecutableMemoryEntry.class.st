"
This class represents a memory slot containing an instruction. 
It hs an instruction and it position in memory. 
"
Class {
	#name : #FogEVMMnemonicExecutableMemoryEntry,
	#superclass : #Object,
	#instVars : [
		'byteNumber',
		'instruction',
		'breakpoint'
	],
	#category : 'FogEVM-Memory'
}

{ #category : #visiting }
FogEVMMnemonicExecutableMemoryEntry >> accept: anInterpreter with: anExecutableMemoryReificaiton [ 
	instruction accept: anInterpreter loadedAt: byteNumber of: self .
	
]

{ #category : #visiting }
FogEVMMnemonicExecutableMemoryEntry >> breakpoint: aBoolean [
	breakpoint := aBoolean
]

{ #category : #'as yet unclassified' }
FogEVMMnemonicExecutableMemoryEntry >> byteNumber [
	^ byteNumber
]

{ #category : #'as yet unclassified' }
FogEVMMnemonicExecutableMemoryEntry >> byteNumber: anInteger [ 
	byteNumber := anInteger
]

{ #category : #visiting }
FogEVMMnemonicExecutableMemoryEntry >> initialize [
	super initialize.
	breakpoint := false.
]

{ #category : #'as yet unclassified' }
FogEVMMnemonicExecutableMemoryEntry >> instruction [
	^ instruction
]

{ #category : #'as yet unclassified' }
FogEVMMnemonicExecutableMemoryEntry >> instruction: aFogVMPush1 [ 
	instruction := aFogVMPush1
]

{ #category : #visiting }
FogEVMMnemonicExecutableMemoryEntry >> manageBreakpoint [
	breakpoint
		ifTrue: [ self halt ]
]

{ #category : #printing }
FogEVMMnemonicExecutableMemoryEntry >> printOn: aStream [
	aStream
		nextPutAll: (byteNumber asBKHexa: 8);
		nextPutAll: ' - ';
		nextPutAll: (instruction asString padRightTo: 50 with: Character space) ;
		nextPutAll: ' (';
		nextPutAll: instruction class comment;
		nextPutAll: ')'
]

{ #category : #'as yet unclassified' }
FogEVMMnemonicExecutableMemoryEntry >> shouldBreak [
	^ breakpoint 
]
