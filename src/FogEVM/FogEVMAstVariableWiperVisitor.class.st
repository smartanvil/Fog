Class {
	#name : #FogEVMAstVariableWiperVisitor,
	#superclass : #FogEVMAstVisitor,
	#instVars : [
		'readWriteTracker',
		'state',
		'assignationValue',
		'currentScope'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #'as yet unclassified' }
FogEVMAstVariableWiperVisitor >> anyScopeHasChanged [
	^ readWriteTracker keys anySatisfy: [ :v | v isEVMVariable not ]
]

{ #category : #'as yet unclassified' }
FogEVMAstVariableWiperVisitor >> readWriteTracker [
	^ readWriteTracker ifNil: [ readWriteTracker := Dictionary new ]
]

{ #category : #visiting }
FogEVMAstVariableWiperVisitor >> visitAssignation: aFogEVMAssignation [
	(aFogEVMAssignation value = aFogEVMAssignation variable or: [ aFogEVMAssignation variable isEVMVariable not ])
		ifTrue: [ currentScope sequence removeStatement: aFogEVMAssignation ]
		ifFalse: [ state := #writing.
			assignationValue := aFogEVMAssignation value.
			aFogEVMAssignation variable accept: self.
			state := #reading.
			aFogEVMAssignation value accept: self ]
]

{ #category : #visiting }
FogEVMAstVariableWiperVisitor >> visitScope: aFogEVMAstScope [
	currentScope := aFogEVMAstScope.
	aFogEVMAstScope temporaries: (aFogEVMAstScope temporaries select: #isEVMVariable).
	aFogEVMAstScope temporaries do: [ :t | self visitVariableDefinition: t ].
	aFogEVMAstScope sequence accept: self.
	currentScope := nil
]

{ #category : #'as yet unclassified' }
FogEVMAstVariableWiperVisitor >> visitSelfDestruct: aFogEVMAstSelfDestruct [ 
	aFogEVMAstSelfDestruct account accept: self 
]

{ #category : #visiting }
FogEVMAstVariableWiperVisitor >> visitVariable: aFogEVMAstVariable [
	state = #writing
		ifTrue: [ (self readWriteTracker at: aFogEVMAstVariable) at: #lastAssignment put: assignationValue.
			(self readWriteTracker at: aFogEVMAstVariable) at: #write put: ((self readWriteTracker at: aFogEVMAstVariable) at: #write) + 1 ]
		ifFalse: [ (self readWriteTracker at: aFogEVMAstVariable) at: #read put: ((self readWriteTracker at: aFogEVMAstVariable) at: #read) + 1 ]
]

{ #category : #visiting }
FogEVMAstVariableWiperVisitor >> visitVariableDefinition: aFogEVMAstVariable [
	self readWriteTracker
		at: aFogEVMAstVariable
		ifPresent: [ :d | (d at: #scopes) add: currentScope ]
		ifAbsentPut: [ {(#scopes -> {currentScope} asSet).
			(#read -> 0).
			(#write -> 0)} asDictionary ]
]

{ #category : #'as yet unclassified' }
FogEVMAstVariableWiperVisitor >> wipe [
	(readWriteTracker associations
		select: [ :a | a key isGenerated and: [ (a value at: #read) = 1 and: [ (a value at: #write) = 1 ] ] ])
		do: [ :a | a key becomeForward: (a value at: #lastAssignment) ].
	(readWriteTracker associations
		select: [ :a | 
			a key isEVMVariable
				and: [ a key isGenerated and: [ (a value at: #read) = 0 and: [ (a value at: #write) > 1 ] ] ] ])
		do: [ :a | a key name: 'NON-READ-' , a key name ].
	(readWriteTracker associations
		select: [ :a | 
			a key isEVMVariable
				and: [ a key isGenerated and: [ (a value at: #read) > 1 and: [ (a value at: #write) = 1 ] ] ] ])
		do: [ :a | 
			(a value at: #lastAssignment) isEVMLiteral
				ifTrue: [ a key becomeForward: (a value at: #lastAssignment) ]
				ifFalse: [ a key value: (a value at: #lastAssignment).
					a key constant: true ] ]
]
