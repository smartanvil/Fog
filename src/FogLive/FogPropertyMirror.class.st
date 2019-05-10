"
Definition of a contract field. 

"
Class {
	#name : #FogPropertyMirror,
	#superclass : #Object,
	#instVars : [
		'name',
		'typename',
		'id',
		'type',
		'layout'
	],
	#category : 'FogLive-Meta-Mirror'
}

{ #category : #'as yet unclassified ' }
FogPropertyMirror >> id [
	<doc: 'It returns the ID of the property. what means it position in the contract'> 
	^ id
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> id: anInteger [ 
	id := anInteger
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> instance: anETHContractInstance [
	^ FogContractInstanceSlot new
		slot: self;
		contractInstance: anETHContractInstance;
		yourself
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> layout [
	<doc: 'It returns the layout of the property. Object in charge of the memory mapping'> 
	^ layout
]

{ #category : #accessing }
FogPropertyMirror >> layout: aLayout [
	layout := aLayout
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> name [
	<doc: 'It returns name of the property'> 
	^ name
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> name: aString [ 
	name := aString
]

{ #category : #printing }
FogPropertyMirror >> printOn: aStream [
	aStream
		nextPutAll: 'Property ';
		nextPutAll: type name;
		nextPutAll: ' ';
		nextPutAll: name
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> type [
	<doc: 'It returns the type of the property'> 
	^ type
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> type: aType [
	type := aType
]

{ #category : #accessing }
FogPropertyMirror >> using: aSession value: aContractAddress at: aBlockTagNumberOrHash [
	<doc: 'It returns the value of this property by using a given session, a contract and a block number '>
	^ layout
		using: aSession
		fetch: self
		from: aContractAddress
		at: aBlockTagNumberOrHash
]
