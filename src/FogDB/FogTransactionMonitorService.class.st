"
This service is polling for checking up transaction monitors resolution 
"
Class {
	#name : #FogTransactionMonitorService,
	#superclass : #TKTService,
	#instVars : [
		'monitors',
		'session'
	],
	#category : 'FogDB-Session-Service'
}

{ #category : #'as yet unclassified' }
FogTransactionMonitorService >> initialize [
	super initialize.
	monitors := Set new
]

{ #category : #'as yet unclassified' }
FogTransactionMonitorService >> monitors [
	^ monitors
]

{ #category : #'as yet unclassified' }
FogTransactionMonitorService >> monitors: aCollection [ 
	monitors := aCollection
]

{ #category : #accessing }
FogTransactionMonitorService >> name [
	^ 'Transaction monitor service'
]

{ #category : #'contract - deploying' }
FogTransactionMonitorService >> receiptFor: aTransactionHash [
	^ (monitors
		add:
			(FogTransactionMonitor new
				transactionHash: aTransactionHash;
				session: session;
				yourself)) future
]

{ #category : #accessing }
FogTransactionMonitorService >> session: aSession [
	session := aSession
]

{ #category : #stepping }
FogTransactionMonitorService >> stepService [
	| timeout |
	monitors do: #check.
	monitors := monitors reject: #isResolved.
	timeout := self timeout.
	timeout wait.
	monitors do: [ :m | m register: timeout ]
]

{ #category : #stepping }
FogTransactionMonitorService >> timeout [
	^ monitors isEmpty
		ifTrue: [ 1 seconds ]
		ifFalse: [ 1 second ]
]
