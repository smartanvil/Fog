"
A transaction monitor is in charge of resolving a related future, by digging into the geth client 
"
Class {
	#name : #FogTransactionMonitor,
	#superclass : #Object,
	#instVars : [
		'transactionHash',
		'future',
		'timeLeft',
		'session'
	],
	#category : 'FogLive-Session-Service'
}

{ #category : #checking }
FogTransactionMonitor >> check [
	<doc: 'It checks if the transaction has been executed, in which case it deploys the related future.'>
	| receipt |
	[ receipt := session receiptForTransaction: transactionHash.
	receipt ifNotNil: [ future deploySuccess: receipt ] ]
		on: Error
		do: [ :e | future deployFailure: e ]
]

{ #category : #'as yet unclassified' }
FogTransactionMonitor >> future [
	<doc: 'It returns the future for the ongoing transaction. It usage is highly discouraged.'>
	^ future ifNil: [ future := TKTFuture new ]
]

{ #category : #'as yet unclassified' }
FogTransactionMonitor >> isResolved [
	^ future isFinished
]

{ #category : #'as yet unclassified' }
FogTransactionMonitor >> register: aDuration [
	<doc: 'It registers a time window. Used by the monitor service to expire the monitors.'>
	timeLeft := self timeLeft - aDuration.
	timeLeft asSeconds <= 0
		ifTrue: [ future
				deployFailure:
					(Error new
						messageText: 'Transaction not finished';
						yourself) ]
]

{ #category : #accessing }
FogTransactionMonitor >> session: aSession [
	session := aSession
]

{ #category : #'as yet unclassified' }
FogTransactionMonitor >> timeLeft [
	<doc: 'It returns the time to live of this monitor. The default initial value is 30 minutes'>
	^ timeLeft ifNil: [ timeLeft := 30 minutes ]
]

{ #category : #'as yet unclassified' }
FogTransactionMonitor >> transactionHash: aString [ 
	transactionHash := aString
]
