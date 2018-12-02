"
A session object is an object that needs to be set up with a session in order to be fully functional. 
"
Class {
	#name : #FogSessionObject,
	#superclass : #Object,
	#instVars : [
		'session'
	],
	#category : #'FogLive-Domain'
}

{ #category : #accessing }
FogSessionObject >> session [
	^ session
]

{ #category : #accessing }
FogSessionObject >> session: aSession [
	session := aSession
]
