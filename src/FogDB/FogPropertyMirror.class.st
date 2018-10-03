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
	#category : 'FogDB-Meta-Mirror'
}

{ #category : #'as yet unclassified ' }
FogPropertyMirror >> id [
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
	^ layout
]

{ #category : #accessing }
FogPropertyMirror >> layout: aLayout [
	layout := aLayout
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> name [
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
	^ type
]

{ #category : #'as yet unclassified' }
FogPropertyMirror >> type: aType [
	type := aType
]

{ #category : #accessing }
FogPropertyMirror >> using: aSession value: aContractAddress at: aBlockTagNumberOrHash [

	^ layout
		using: aSession
		fetch: self
		from: aContractAddress
		at: aBlockTagNumberOrHash
]
