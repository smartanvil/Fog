Class {
	#name : #FogEVMAstFinder,
	#superclass : #FogEVMAstVisitor,
	#instVars : [
		'result',
		'condition',
		'found'
	],
	#category : 'FogEVM-Decompiler'
}

{ #category : #'as yet unclassified' }
FogEVMAstFinder >> condition: aValuable [
	condition := aValuable
]

{ #category : #'as yet unclassified' }
FogEVMAstFinder >> found [
	^ found
]

{ #category : #visiting }
FogEVMAstFinder >> initialize [
	super initialize.
	found := Set new.
]

{ #category : #visiting }
FogEVMAstFinder >> visitAstNode: aFogEVMAstNode [
	(condition value: aFogEVMAstNode)
		ifTrue: [ found add: aFogEVMAstNode ]
]
