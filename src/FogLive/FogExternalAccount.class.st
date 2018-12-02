"
Account related with a real user. This account uses most of the default account behaviour.
"
Class {
	#name : #FogExternalAccount,
	#superclass : #FogAccount,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#category : #'FogLive-Domain'
}

{ #category : #'as yet unclassified' }
FogExternalAccount class >> for: aHash [
	^ self new
		address: aHash;
		name: 'Unknown account';
		yourself
]

{ #category : #'as yet unclassified' }
FogExternalAccount class >> kindOfAccount [
	^ 'Account'
]

{ #category : #equality }
FogExternalAccount >> = anObject [
	self species = anObject species
		ifFalse: [ ^ false ].
	^ self valuesToCompareForEquality = anObject valuesToCompareForEquality
]

{ #category : #equality }
FogExternalAccount >> hash [
	^self valuesToCompareForEquality inject: self species hash into: [:hash :comparisonValue|
		(hash bitXor: comparisonValue hash) hashMultiply]

]

{ #category : #equality }
FogExternalAccount >> isAccount [
	<doc: 'The external account is treated as an account. This method returns always true'>
	^ true
]

{ #category : #equality }
FogExternalAccount >> printOn: aStream [
	^ ('Account ', name asString ) printOn: aStream
]
