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

{ #category : #accessing }
FogSessionObject >> session [
	^ session
]

{ #category : #accessing }
FogSessionObject >> session: aSession [
	session := aSession
]
