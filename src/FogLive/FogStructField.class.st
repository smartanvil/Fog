"
Struct field reificates an entry of a struct 
"
Class {
	#name : #FogStructField,
	#superclass : #Object,
	#instVars : [
		'name',
		'type'
	],
	#category : 'FogLive-Meta-Types'
}

{ #category : #accessing }
FogStructField >> name [
	^ name
]

{ #category : #accessing }
FogStructField >> name: aName [
	name := aName 
]

{ #category : #accessing }
FogStructField >> printOn: aStream [
	^ aStream
		nextPutAll: type name;
		nextPutAll: ' ';
		nextPutAll: name
]

{ #category : #accessing }
FogStructField >> type [
	^ type
]

{ #category : #accessing }
FogStructField >> type: aType [
	type := aType
]

{ #category : #'as yet unclassified' }
FogStructField >> unpackStream: aReadStream using: aFogPacker [ 
	^ self type unpackStream: aReadStream using: aFogPacker 
]
