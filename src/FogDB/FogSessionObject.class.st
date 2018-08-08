"
Connected object has some charting base methods and the connection message. 
"
Class {
	#name : #FogSessionObject,
	#superclass : #Object,
	#instVars : [
		'session'
	],
	#category : 'FogDB-Domain'
}

{ #category : #'as yet unclassified' }
FogSessionObject class >> collectionSelector [
	^ self subclassResponsibility
]

{ #category : #accessing }
FogSessionObject class >> session [
	^ FogConnection createDefaultConnection session.
]

{ #category : #accessing }
FogSessionObject >> session [
	^ session
]

{ #category : #accessing }
FogSessionObject >> session: aSession [
	session := aSession
]
