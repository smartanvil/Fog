Class {
	#name : #FogContractDescriptionTests,
	#superclass : #FogTestCase,
	#instVars : [
		'description'
	],
	#category : #FogDBTests
}

{ #category : #'building suites' }
FogContractDescriptionTests class >> testParameters [
	^ super testParameters
		forSelector: #description
		addOptions: FogTestingContractProvider contractDescriptions
]

{ #category : #initialization }
FogContractDescriptionTests >> description: aDescription [
	description := aDescription
]

{ #category : #initialization }
FogContractDescriptionTests >> testConstructorMirrorCreated [
	self assert: (description mirror constructor isKindOf: FogConstructorMirror)
]

{ #category : #initialization }
FogContractDescriptionTests >> testMethodMirrorCreated [
	self
		assert: (description mirror instanceMirror methods allSatisfy: [ :d | d isKindOf: FogMethodMirror ])
]

{ #category : #initialization }
FogContractDescriptionTests >> testMirrorCreated [
	self assert: (description mirror isKindOf: FogContractMirror)
]

{ #category : #initialization }
FogContractDescriptionTests >> testMirrorInstanceCreated [
	self assert: (description mirror instanceMirror isKindOf: FogContractInstanceMirror)
]

{ #category : #initialization }
FogContractDescriptionTests >> testPropertyMirrorCreated [
	self assert: (description mirror instanceMirror properties allSatisfy: [ :d | d isKindOf: FogPropertyMirror ])
]
