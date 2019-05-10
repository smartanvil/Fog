"
This objects mirrors a contract. 

Allowing to fetch raw content and execute methods on given instances
"
Class {
	#name : #FogContractInstanceMirror,
	#superclass : #Object,
	#instVars : [
		'properties',
		'methods',
		'contractMirror'
	],
	#category : 'FogLive-Meta-Mirror'
}

{ #category : #adding }
FogContractInstanceMirror >> contractMirror: aContractMirror [
	contractMirror := aContractMirror
]

{ #category : #adding }
FogContractInstanceMirror >> initialize [
	super initialize .
	methods := OrderedCollection new.
	properties := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
FogContractInstanceMirror >> method: aString [
	^ self methods detect: [ :m | m selector = aString ]
]

{ #category : #'as yet unclassified' }
FogContractInstanceMirror >> methods [
	<doc: 'Returns all the methods of this contract instance'>
	^ methods
]

{ #category : #'as yet unclassified' }
FogContractInstanceMirror >> methods: aCollection [ 
	methods := aCollection
]

{ #category : #'as yet unclassified' }
FogContractInstanceMirror >> properties [
	<doc: 'Returns all the properties of a contract instance'>
	^ properties
]

{ #category : #adding }
FogContractInstanceMirror >> properties: aCollection [
	properties := aCollection
]

{ #category : #adding }
FogContractInstanceMirror >> property: aName [
	<doc: 'It returns the property mirror named as the given parameter'>
	^ properties detect: [ :p | p name = aName ]
]

{ #category : #adding }
FogContractInstanceMirror >> using: session property: aPropertyName on: anInstance at: aBlockTagNumberOrHash [
	<doc: 'It returns the state of a property by name on the given state'>
	^ (properties detect: [ :p | p name = aPropertyName ]) using: session value: anInstance  at: aBlockTagNumberOrHash
]

{ #category : #adding }
FogContractInstanceMirror >> valuesFor: anInstance [
	^ properties collect: [ :p | p name -> (p value: anInstance) ]
]
