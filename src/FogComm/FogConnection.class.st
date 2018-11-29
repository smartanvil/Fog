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

{ #category : #accessing }
FogConnection >> admin [
	^ FogAdmin new
		connection: self;
		yourself
]

{ #category : #'rpc call' }
FogConnection >> call: aETHMessageSend [
	| response |
	response := ZnEasy post: url data: (ZnEntity json: (self encode: aETHMessageSend)).
	self processResponse: response.
	^ self decode: response entity
]

{ #category : #converting }
FogConnection >> decode: aString [
	^ (NeoJSONReader on: aString readStream) next
]

{ #category : #converting }
FogConnection >> encode: aETHMessage [
	^ NeoJSONWriter toString: (self transferEntityFromMessage: aETHMessage)
]

{ #category : #accessing }
FogConnection >> eth [
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

{ #category : #'rpc call' }
FogConnection >> nextRequestId [
	| nextId |
	nextId := requestId.
	requestId := requestId + 1.
	^ nextId
]

{ #category : #'rpc call' }
FogConnection >> processResponse: aZnResponse [ 
	"nothing yet"
]

{ #category : #'rpc call' }
FogConnection >> protocolVersion [
	^ '2.0'
]

{ #category : #reset }
FogConnection >> reset [
	eth := nil
]

{ #category : #'rpc call' }
FogConnection >> transferEntityFromMessage: aETHMessage [
	^ FogTransferEntity new
		message: aETHMessage;
		id: self nextRequestId;
		jsonrpc: self protocolVersion;
		yourself
]

{ #category : #accessing }
FogConnection >> url: anUndefinedObject [ 
	url := anUndefinedObject
]

{ #category : #accessing }
FogConnection >> web3 [
	^ FogWeb3 new
		connection: self;
		yourself
]
