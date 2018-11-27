"
This reference is a REALLY naive implementation of names for contracts and packages.
It's not yet fully needed, but it's intended to make easier the query of loaded contracts.
Maybe it can be extended to access other objects, as blocks, transactions, etc. but so far, the query is in charge of UQLL.
"
Class {
	#name : #FogReference,
	#superclass : #Object,
	#instVars : [
		'parts'
	],
	#category : #'FogDB-Meta-Description'
}

{ #category : #initialization }
FogReference >> / aPart [
	parts add: aPart
]

{ #category : #initialization }
FogReference >> initialize [
	super initialize.
	parts := OrderedCollection new
]

{ #category : #initialization }
FogReference >> resolveWith: aSession [
	| loaded |
	self assert: parts size < 3.	" Not yet full implemented. Not sure if i"
	loaded := aSession packages at: parts first.
	parts size = 1
		ifTrue: [ ^ loaded ].
	^ loaded descriptions detect: [ :d | d name = parts second ]
]
