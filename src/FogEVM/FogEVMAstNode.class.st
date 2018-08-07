Class {
	#name : #FogEVMAstNode,
	#superclass : #Object,
	#instVars : [
		'instruction'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstNode >> instruction: aFogEVMMnemonicExecutableMemoryEntry [ 
	instruction := aFogEVMMnemonicExecutableMemoryEntry
]

{ #category : #testing }
FogEVMAstNode >> isConditionalJump [
	^ false 
]

{ #category : #'as yet unclassified' }
FogEVMAstNode >> isEVMLiteral [
	^ false. 
]

{ #category : #testing }
FogEVMAstNode >> isEVMMessageSend [
	^ false 
]

{ #category : #testing }
FogEVMAstNode >> isEVMVariable [ 
	^ false 
]

{ #category : #testing }
FogEVMAstNode >> isEndingState [
	^ false.
]

{ #category : #'as yet unclassified' }
FogEVMAstNode >> isJump [
	^ false 
]

{ #category : #'as yet unclassified' }
FogEVMAstNode >> isJumpDest [
	^ false. 
]

{ #category : #'as yet unclassified' }
FogEVMAstNode >> isStorageAccess [
	^ false
]

{ #category : #testing }
FogEVMAstNode >> isStrictJump [
	^ false 
]

{ #category : #enumerating }
FogEVMAstNode >> select: aCondition [
	| finder |
	finder := FogEVMAstFinder new
		condition: aCondition;
		yourself.
	self accept: finder.
	^ finder found
]
