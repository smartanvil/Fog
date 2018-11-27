"
This mirror exposes Contract level meta. as the types defined by the contract and the constructor method mirror .
"
Class {
	#name : #FogContractMirror,
	#superclass : #Object,
	#instVars : [
		'types',
		'constructor',
		'instanceMirror'
	],
	#category : 'FogLive-Meta-Mirror'
}

{ #category : #accessing }
FogContractMirror >> constructor [
	^ constructor
]

{ #category : #accessing }
FogContractMirror >> constructor: aConstructorMethod [
	constructor := aConstructorMethod
]

{ #category : #accessing }
FogContractMirror >> initialize [
	super initialize.
	instanceMirror := FogContractInstanceMirror new.
	instanceMirror contractMirror: self.
]

{ #category : #accessing }
FogContractMirror >> instanceMirror [
	^ instanceMirror 
]

{ #category : #'as yet unclassified' }
FogContractMirror >> method: aString [
	^ (aString beginsWith: #constructor)
		ifTrue: [ constructor ]
		ifFalse: [ self error: 'Constructor not founded' ]
]

{ #category : #accessing }
FogContractMirror >> types [
	^ types
]

{ #category : #accessing }
FogContractMirror >> types: aSetOfTypes [
	types := aSetOfTypes
]
