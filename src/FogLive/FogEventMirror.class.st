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
FogEventMirror >> createEventRegistrationUsing: aSession [
	aSession createEventRegistrationFor: self
]

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

{ #category : #accessing }
FogEventMirror >> signature [
	^ '{1}({2})'
		format:
			{name.
			(',' join: (parameters collect: [ :p | p signatureName ]))}
]
