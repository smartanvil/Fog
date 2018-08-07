Class {
	#name : #FogEVMAstVariable,
	#superclass : #FogEVMAstNode,
	#instVars : [
		'name',
		'createdAt',
		'type',
		'constant',
		'value'
	],
	#classInstVars : [
		'lastNumber'
	],
	#category : 'FogEVM-Interpreter'
}

{ #category : #'as yet unclassified' }
FogEVMAstVariable class >> generateName [
	| gen |
	gen := 'TVar-{1}' format: {lastNumber}.
"	self haltIf: lastNumber = 77."
	lastNumber := lastNumber + 1.
	^ gen
]

{ #category : #initialization }
FogEVMAstVariable class >> initialize [
	super initialize.
	lastNumber := 0
]

{ #category : #'as yet unclassified' }
FogEVMAstVariable >> accept: aFogEVMAstVariableWiperVisitor [ 
	aFogEVMAstVariableWiperVisitor visitVariable: self 
]

{ #category : #printing }
FogEVMAstVariable >> constant: aBool [
	constant := aBool
]

{ #category : #accessing }
FogEVMAstVariable >> copy [
	^ self  
]

{ #category : #'as yet unclassified' }
FogEVMAstVariable >> createdAt: aFogEVMMnemonicExecutableMemoryEntry [
	createdAt := aFogEVMMnemonicExecutableMemoryEntry
]

{ #category : #printing }
FogEVMAstVariable >> initialize [
	super initialize.
	constant := false. 
]

{ #category : #printing }
FogEVMAstVariable >> isConstant [
	^ constant
]

{ #category : #accessing }
FogEVMAstVariable >> isEVMVariable [ 
	^ true 
]

{ #category : #'as yet unclassified' }
FogEVMAstVariable >> isGenerated [
	^ name isNil or: [ name beginsWith: 'TVar']
]

{ #category : #'as yet unclassified' }
FogEVMAstVariable >> literalValue [
	self shouldBeImplemented.
]

{ #category : #accessing }
FogEVMAstVariable >> name [
	^ (name ifNil: [ name := self class generateName ]) copyReplaceAll: 'TVar' with: 'CONST'
]

{ #category : #accessing }
FogEVMAstVariable >> name: aName [
	name := aName 
]

{ #category : #printing }
FogEVMAstVariable >> printOn: aStream [
	"'	self type printOn: aStream.'"

	self isConstant
		ifTrue: [ value isEVMLiteral
				ifTrue: [ aStream nextPutAll: 'CONST('.
					value printOn: aStream.
					aStream nextPutAll: ')'.
					^ self ] ].
	aStream nextPutAll: ' '.
	aStream nextPutAll: self name
]

{ #category : #'as yet unclassified ' }
FogEVMAstVariable >> type [
	^ type ifNil: [ type := FogEVMAstDuckType new ]
]

{ #category : #printing }
FogEVMAstVariable >> value: aValue [
	(self isConstant and: [ value isNotNil and: [ value ~= aValue ] ])
		ifTrue: [ self error: ' Constant cannot be assigned twice. ' ]
		ifFalse: [ value := aValue ]
]
