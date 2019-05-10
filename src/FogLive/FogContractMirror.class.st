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
	<doc: 'Returns the constructor of this contract.'>
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
	<doc: 'Returns the contract''s instance side mirror'>
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
	<doc: 'Returns the types used by the contract'>
	^ types
]

{ #category : #accessing }
FogContractMirror >> types: aSetOfTypes [
	types := aSetOfTypes
]
