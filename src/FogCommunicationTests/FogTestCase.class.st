"
Test case implements some assert code and setup. 
"
Class {
	#name : #FogTestCase,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'session',
		'connection'
	],
	#category : #FogCommunicationTests
}

{ #category : #'building suites' }
FogTestCase class >> testParameters [
	^ ParametrizedTestMatrix new
		forSelector: #connection addOptions: {[ FogConnection on: self url ]};
		forSelector: #session
			addOptions:
			{[ :test | test connection session ].
			[ :test | test connection nonCachedSession ]}
]

{ #category : #'building suites' }
FogTestCase class >> url [
	^ 'http://localhost:8545'
]

{ #category : #running }
FogTestCase >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #converting }
FogTestCase >> assertEntityFromMessage: aMessage equalsToJson: aString [
	| entity expected |
	entity := connection transferEntityFromMessage: aMessage.
	entity := self transferEntityFromJsonString: (NeoJSONWriter toString: entity).
	expected := self transferEntityFromJsonString: aString.
	self assert: entity equals: expected
]

{ #category : #running }
FogTestCase >> connection [
	^ connection
]

{ #category : #running }
FogTestCase >> connection: aConnection [
	connection := aConnection
]

{ #category : #running }
FogTestCase >> session: aSession [
	session := aSession
]

{ #category : #running }
FogTestCase >> setUp [
	super setUp.
	FogCache reset.
	session
		applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0')
]

{ #category : #running }
FogTestCase >> tearDown [
	super tearDown.
	session finalize
]

{ #category : #'as yet unclassified' }
FogTestCase >> transferEntityFromJsonString: aString [
	| entity message |
	entity := (NeoJSONReader on: aString readStream) next.
	message := FogMessage new
		method: (entity at: #method);
		parameters: (entity at: #params);
		yourself.
	^ FogTransferEntity new
		id: (entity at: #id);
		jsonrpc: (entity at: #jsonrpc);
		message: message;
		yourself
]
