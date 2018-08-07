Class {
	#name : #FogEVMAstScope,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'id',
		'temporaries',
		'sequence',
		'finishesAt'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstScope >> accept: aFogEVMAstVariableWiperVisitor [
	aFogEVMAstVariableWiperVisitor visitScope: self
]

{ #category : #'as yet unclassified' }
FogEVMAstScope >> addTemporary: aFogEVMAstVariable [ 
	temporaries add: aFogEVMAstVariable
]

{ #category : #'as yet unclassified' }
FogEVMAstScope >> finishesAt: aFogEVMMnemonicExecutableMemoryEntry [
	finishesAt := aFogEVMMnemonicExecutableMemoryEntry
]

{ #category : #'as yet unclassified' }
FogEVMAstScope >> id: anInteger [
	id := anInteger
]

{ #category : #initialization }
FogEVMAstScope >> initialize [
	super initialize.
	temporaries := OrderedCollection new. 
	sequence := FogEVMSequence new .
]

{ #category : #'as yet unclassified' }
FogEVMAstScope >> linkJumpsTo: aCollection [
	sequence statements select: #isJump thenDo: [ :s | self halt ]
]

{ #category : #printing }
FogEVMAstScope >> printOn: aStream [
	aStream nextPutAll: ' |'.
	temporaries
		do: [ :t | 
			aStream
				nextPutAll: ' ';
				nextPutAll: t name;
				nextPutAll: ' ' ].
	aStream nextPutAll: '| '.
	aStream nextPutAll: String crlf.
	sequence printOn: aStream
]

{ #category : #'as yet unclassified' }
FogEVMAstScope >> sequence [
	^ sequence
]

{ #category : #'as yet unclassified' }
FogEVMAstScope >> temporaries [
	^ temporaries
]

{ #category : #accessing }
FogEVMAstScope >> temporaries: aCollectionOfTemporaries [
	temporaries := aCollectionOfTemporaries
]
