Class {
	#name : #FogEVMAstScopeBuilderVisitor,
	#superclass : #FogEVMAstMethodBuilderVisitor,
	#category : 'FogEVM-Decompiler'
}

{ #category : #'as yet unclassified' }
FogEVMAstScopeBuilderVisitor >> extractFromInstalledSequence [
	method := FogEVMAstMethod new.
	hasEntered := inMethodBody := true.
	self assert: nextNode ~= 1.
	[ self hasNextStatement ]
		whileTrue: [ | stat |
			stat := self nextStatement.
			self visitSequenceStatement: stat ]
]

{ #category : #testing }
FogEVMAstScopeBuilderVisitor >> hasNextStatement [
	^ super hasNextStatement and: [ currentStatement isEndingState not ]
]

{ #category : #'as yet unclassified' }
FogEVMAstScopeBuilderVisitor >> peekNextNode [
	^ sequence statements at: nextNode.
]
