"
Base API Module. This hierarichy represents the same as the EthereumAPI project one, but it transforms the responses into real objects 
"
Class {
	#name : #FogAPIAccess,
	#superclass : #Object,
	#instVars : [
		'connection',
		'api'
	],
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogAPIAccess >> connection: aBKConnection [
	connection := aBKConnection
]

{ #category : #'as yet unclassified' }
FogAPIAccess >> initialize [
	self setApi.
]

{ #category : #'as yet unclassified' }
FogAPIAccess >> processResponse: aResponse [
	" nothing yet "

	(aResponse includesKey: #error)
		ifTrue: [ Error signal: ('Remote Error: ({code}):{message}' format: (aResponse at: #error)) ]
]

{ #category : #'as yet unclassified' }
FogAPIAccess >> send: aMessage [
	| response |
	response := connection call: aMessage.
	self processResponse: response.
	
	^ response at: #result
]

{ #category : #'as yet unclassified' }
FogAPIAccess >> setApi [ 
	self subclassResponsibility 
]
