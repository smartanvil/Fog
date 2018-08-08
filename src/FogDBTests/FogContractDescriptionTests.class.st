Class {
	#name : #FogContractDescriptionTests,
	#superclass : #FogTestCase,
	#instVars : [
		'descriptions'
	],
	#category : 'FogDBTests'
}

{ #category : #initialization }
FogContractDescriptionTests >> contractDescriptions [
	^ FogTestingContractProvider contractsDescriptions: session
]

{ #category : #initialization }
FogContractDescriptionTests >> setUp [
	super setUp.
	descriptions := self contractDescriptions
]

{ #category : #initialization }
FogContractDescriptionTests >> testConstructorMirrorCreated [
	descriptions allSatisfy: [ :d | d mirror constructor isKindOf: FogConstructorMirror ]
]

{ #category : #initialization }
FogContractDescriptionTests >> testMethodMirrorCreated [
	(descriptions flatCollect: [ :d | d mirror instanceMirror methods ]) allSatisfy: [ :d | d isKindOf: FogMethodMirror ]
]

{ #category : #initialization }
FogContractDescriptionTests >> testMirrorCreated [
	descriptions allSatisfy: [ : d | d mirror isKindOf: FogContractMirror  ]
]

{ #category : #initialization }
FogContractDescriptionTests >> testMirrorInstanceCreated [
	descriptions allSatisfy: [ :d | d mirror instanceMirror isKindOf: FogContractInstanceMirror ]
]

{ #category : #initialization }
FogContractDescriptionTests >> testPropertyMirrorCreated [
	(descriptions flatCollect: [ :d | d mirror instanceMirror properties ]) allSatisfy: [ :d | d isKindOf: FogPropertyMirror ]
]
