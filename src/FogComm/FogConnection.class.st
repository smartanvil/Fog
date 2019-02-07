"
Connection. It stores the number of request. It has the responsibilite of connecting the RPC server (rest) and managing base communication, asi deconding enconding 
"
Class {
	#name : #FogConnection,
	#superclass : #Object,
	#instVars : [
		'url',
		'json',
		'requestId',
		'eth',
		'service'
	],
	#classInstVars : [
		'connection'
	],
	#category : 'FogComm-Connection'
}

{ #category : #'as yet unclassified' }
FogConnection class >> createDefaultConnection [
	^ self on: 'http://localhost:8545'
]

{ #category : #'as yet unclassified' }
FogConnection class >> on: anUrl [
	^ self new
		url: anUrl;
		yourself
]

{ #category : #'rpc call' }
FogConnection >> call: aFogMessage [
	| response |
	<doc: 'Encodes a FogMessage and send it to an GETH RPC end point'>
	response := ZnEasy post: url data: (ZnEntity json: (self encode: aFogMessage)).
	self processResponse: response.
	^ self decode: response entity
]

{ #category : #converting }
FogConnection >> decode: aString [
	<doc: 'Decodes a message according to the JSON based GETH protocol definition'>
	^ (NeoJSONReader on: aString readStream) next
]

{ #category : #converting }
FogConnection >> encode: aETHMessage [
	<doc: 'Encodes a message according to the JSON based GETH protocol definition'>
	^ NeoJSONWriter toString: (self transferEntityFromMessage: aETHMessage)
]

{ #category : #accessing }
FogConnection >> eth [
	<doc: 'Get an API Access object. responsible to resolve the eth_ kind of messages (more in FogEth)'>
	^ eth
		ifNil: [ eth := FogEth new
				connection: self;
				yourself ]
]

{ #category : #initialization }
FogConnection >> initialize [
	super initialize.
	requestId := 1.

]

{ #category : #accessing }
FogConnection >> isTestingConnection [
	^ false
]

{ #category : #accessing }
FogConnection >> net [
	<doc: 'Get an API Access object. responsible to resolve the net_ kind of messages (more in FogNet)'>
	^ FogNet new
		connection: self;
		yourself
]

{ #category : #private }
FogConnection >> nextRequestId [
	| nextId |
	nextId := requestId.
	requestId := requestId + 1.
	^ nextId
]

{ #category : #private }
FogConnection >> processResponse: aZnResponse [ 
	"nothing yet"
]

{ #category : #'rpc call' }
FogConnection >> protocolVersion [
	^ '2.0'
]

{ #category : #private }
FogConnection >> transferEntityFromMessage: aETHMessage [
	^ FogTransferEntity new
		message: aETHMessage;
		id: self nextRequestId;
		jsonrpc: self protocolVersion;
		yourself
]

{ #category : #accessing }
FogConnection >> url: anUndefinedObject [ 
	<doc: 'Set up the URL to GETH RPC endpoint'>
	url := anUndefinedObject
]

{ #category : #accessing }
FogConnection >> web3 [
	<doc: 'Get an API Access object. responsible to resolve the web3_ kind of messages (more in FogWeb3)'>
	^ FogWeb3 new
		connection: self;
		yourself
]
