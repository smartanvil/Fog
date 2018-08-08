"
No account objet. For avoiding nil
"
Class {
	#name : #FogNoAccount,
	#superclass : #FogAccount,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#classInstVars : [
		'singleInstance'
	],
	#category : 'FogDB-Domain'
}

{ #category : #'as yet unclassified' }
FogNoAccount class >> kindOfAccount [
	^ 'No Account'
]

{ #category : #'as yet unclassified' }
FogNoAccount class >> nilAccount [
	^ singleInstance ifNil: [ singleInstance := FogNoAccount new ]
]

{ #category : #equality }
FogNoAccount >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #equality }
FogNoAccount >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #equality }
FogNoAccount >> initialize [
	super initialize. 
	name := ' No Account '.
	hash := name hash asString.
]
