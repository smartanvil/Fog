"
Represents an Account in ethereum network. It counts with three subclasses , contract , external and null - account
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
	#category : #'FogLive-Domain'
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
	<doc: 'Returns the account''s hash address'>
	^ self privateAddress
]

{ #category : #equality }
FogAccount >> address: aHash [
	address := aHash
]

{ #category : #equality }
FogAccount >> balance [
	<doc: 'Returns the account''s current balance'>
	^ self session getBalance: self address
]

{ #category : #equality }
FogAccount >> balanceOn: aBlockNumberOrHash [
	<doc: 'Returns the account''s  balance at the aBlockNumberOrHash block'>
	^ self session getBalance: self address block: aBlockNumberOrHash
]

{ #category : #equality }
FogAccount >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #equality }
FogAccount >> isAccount [
	<doc:
		'An account, is by default always an account, despite if it is a contract or an external account. It does not happens the same with the NoAccount'>
	^ true
]

{ #category : #equality }
FogAccount >> isContract [
	<doc: 'This method allows to know the kind of account that we are dealing with: Contract / External'>
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
FogAccount >> privateAddress [
	^ address
]

{ #category : #equality }
FogAccount >> valuesToCompareForEquality [
	^ { address }
]
