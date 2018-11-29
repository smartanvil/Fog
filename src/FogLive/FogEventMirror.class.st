Class {
	#name : #FogEventMirror,
	#superclass : #Object,
	#instVars : [
		'parameters',
		'name'
	],
	#category : #'FogLive-Meta-Mirror'
}

{ #category : #accessing }
FogEventMirror >> name [
	^ name
]

{ #category : #accessing }
FogEventMirror >> name: aString [
	name := aString
]

{ #category : #accessing }
FogEventMirror >> parameters [
	^ parameters
]

{ #category : #accessing }
FogEventMirror >> parameters: aCollection [ 
	parameters := aCollection
]
