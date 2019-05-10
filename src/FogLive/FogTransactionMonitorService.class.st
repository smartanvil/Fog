"
This service is polling for checking up transaction monitors resolution 
"
Class {
	#name : #FogTransactionMonitorService,
	#superclass : #TKTService,
	#instVars : [
		'monitors',
		'session',
		'mutex'
	],
	#category : #'FogLive-Session-Service'
}

{ #category : #'as yet unclassified' }
FogTransactionMonitorService >> initialize [
	super initialize.
	monitors := Set new.
	mutex := Mutex new .
]

{ #category : #'as yet unclassified' }
FogTransactionMonitorService >> monitors [
	<doc: 'It returns all the transaction''s monitors used by this service'>
	^ monitors copy
]

{ #category : #'as yet unclassified' }
FogTransactionMonitorService >> monitors: aCollection [
	mutex critical: [ monitors := aCollection ]
]

{ #category : #accessing }
FogTransactionMonitorService >> name [
	^ 'Transaction monitor service' , self hash asString 
]

{ #category : #'contract - deploying' }
FogTransactionMonitorService >> receiptFor: aTransactionHash [
	| monitor |
	monitor := FogTransactionMonitor new
		transactionHash: aTransactionHash;
		session: session;
		yourself.
	mutex critical: [ monitors add: monitor ].
	^ monitor future
]

{ #category : #accessing }
FogTransactionMonitorService >> session: aSession [
	mutex critical: [ session := aSession ]
]

{ #category : #stepping }
FogTransactionMonitorService >> stepService [
	| timeout stepMonitors remove |
	mutex critical: [ stepMonitors := monitors copy ].
	stepMonitors do: #check.
	remove := stepMonitors select: #isResolved.
	mutex critical: [ monitors removeAll: remove ].
	timeout := self timeout.
	timeout wait.
	stepMonitors do: [ :m | m register: timeout ]
]

{ #category : #stepping }
FogTransactionMonitorService >> timeout [
	^ monitors isEmpty
		ifTrue: [ 1 seconds ]
		ifFalse: [ 0.5 second ]
]
