"
Represents an Account in ethereum network. It may be external, contract or nil 
"
Class {
	#name : #FogAccount,
	#superclass : #FogSessionObject,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'name',
		'address'
	],
	#category : 'FogDB-Domain'
}

{ #category : #'as yet unclassified' }
FogAccount class >> collectionSelector [
	^ #accounts
]

{ #category : #'as yet unclassified' }
FogAccount class >> nilAccount [
	^ FogNoAccount nilAccount
]

{ #category : #equality }
FogAccount >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #equality }
FogAccount >> address [
	^ self privateAccountHash
]

{ #category : #equality }
FogAccount >> address: aHash [
	address := aHash
]

{ #category : #equality }
FogAccount >> balance [
	^ self session getBalance: self address
]

{ #category : #equality }
FogAccount >> balanceOn: aBlockNumberOrHash [
	^ self session getBalance: self address block: aBlockNumberOrHash
]

{ #category : #equality }
FogAccount >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #equality }
FogAccount >> isContract [
	^ false
]

{ #category : #equality }
FogAccount >> name [
	^ name
]

{ #category : #equality }
FogAccount >> name: anAccountName [
	name := anAccountName
]

{ #category : #equality }
FogAccount >> privateAccountHash [
	^ address
]

{ #category : #equality }
FogAccount >> valuesToCompareForEquality [
	^ { address }
]
