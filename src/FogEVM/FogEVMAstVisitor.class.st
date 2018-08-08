Class {
	#name : #FogEVMAstVisitor,
	#superclass : #Object,
	#category : 'FogEVM-Decompiler'
}

{ #category : #visiting }
FogEVMAstVisitor >> visitAssignation: aFogEVMAssignation [
	self visitAstNode: aFogEVMAssignation.
	aFogEVMAssignation variable accept: self.
	aFogEVMAssignation value accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitAstNode: aFogEVMAstNode [
	" pass "
]

{ #category : #visiting }
FogEVMAstVisitor >> visitCallData: aFogEVMAstCallData [ 
	self visitAstNode: aFogEVMAstCallData
]

{ #category : #visiting }
FogEVMAstVisitor >> visitCallDataSize: aFogEVMAstCallDataSize [ 
	self visitAstNode: aFogEVMAstCallDataSize
]

{ #category : #visiting }
FogEVMAstVisitor >> visitCaller: aFogEVMAstCaller [ 
		self visitAstNode:aFogEVMAstCaller
]

{ #category : #'as yet unclassified' }
FogEVMAstVisitor >> visitCodeCopy: aFogEVMAstCodeCopy [ 

	self visitAstNode: aFogEVMAstCodeCopy.
	aFogEVMAstCodeCopy loadingArea accept: self.
	aFogEVMAstCodeCopy fromInstruction accept: self.
	aFogEVMAstCodeCopy amountOfInstructions accept: self.


]

{ #category : #visiting }
FogEVMAstVisitor >> visitConditionalJump: aFogEVMAstConditionalJump [
	self visitAstNode: aFogEVMAstConditionalJump.
	aFogEVMAstConditionalJump condition accept: self.
	aFogEVMAstConditionalJump address accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitJump: aFogEVMAstJump [
	self visitAstNode: aFogEVMAstJump.
	aFogEVMAstJump address accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitJumpTag: aFogEVMAstJumpTag [
	self visitAstNode: aFogEVMAstJumpTag
]

{ #category : #visiting }
FogEVMAstVisitor >> visitLiteral: aFogEVMLiteral [
	self visitAstNode: aFogEVMLiteral
]

{ #category : #visiting }
FogEVMAstVisitor >> visitMemoryLoad: aFogEVMAstMemoryLoad [
	self visitAstNode: aFogEVMAstMemoryLoad.
	aFogEVMAstMemoryLoad fromAddress accept: self.
	aFogEVMAstMemoryLoad amountOfBytes accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitMemoryStore: aFogEVMAstMemoryStore [
	self visitAstNode: aFogEVMAstMemoryStore.
	aFogEVMAstMemoryStore address accept: self.
	aFogEVMAstMemoryStore value accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitMessageSend: aFogEVMAstBinaryMessageSend [
	self visitAstNode: aFogEVMAstBinaryMessageSend.
	aFogEVMAstBinaryMessageSend receiver accept: self.
	aFogEVMAstBinaryMessageSend arguments do: [ :a | a accept: self ]
]

{ #category : #visiting }
FogEVMAstVisitor >> visitReturn: aFogEVMAstReturn [
	self visitAstNode: aFogEVMAstReturn.
	aFogEVMAstReturn returns accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitScope: aFogEVMAstScope [
	self visitAstNode: aFogEVMAstScope.
	aFogEVMAstScope sequence accept: self
]

{ #category : #'as yet unclassified' }
FogEVMAstVisitor >> visitSelfDestruct: aFogEVMAstSelfDestruct [ 
	self visitAstNode: aFogEVMAstSelfDestruct.
	aFogEVMAstSelfDestruct account accept: self 
]

{ #category : #visiting }
FogEVMAstVisitor >> visitSequence: aFogEVMSequence [
	self visitAstNode: aFogEVMSequence.
	aFogEVMSequence statements do: [ :s | s ifNotNil: [ s accept: self ] ]
]

{ #category : #visiting }
FogEVMAstVisitor >> visitStop: aFogEVMAstStop [
	self visitAstNode: aFogEVMAstStop
]

{ #category : #visiting }
FogEVMAstVisitor >> visitStorageLoad: aFogEVMAstStorageLoad [
	self visitAstNode: aFogEVMAstStorageLoad.
	aFogEVMAstStorageLoad address accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitStorageStore: aFogEVMAstStorageStore [
	self visitAstNode: aFogEVMAstStorageStore.
	aFogEVMAstStorageStore address accept: self.
	aFogEVMAstStorageStore value accept: self
]

{ #category : #visiting }
FogEVMAstVisitor >> visitVariable: aFogEVMAstVariable [
	self visitAstNode: aFogEVMAstVariable
]
