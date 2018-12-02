"
FogNetAPI relative 
"
Class {
	#name : #FogNet,
	#superclass : #FogAPIAccess,
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogNet >> listening [
	<doc: 'Returns <code>true</code> if client is actively listening for network connections.'>
	^ self send: api messageNetListening
]

{ #category : #'as yet unclassified' }
FogNet >> setApi [
	api := FogNetAPI new
]

{ #category : #'as yet unclassified' }
FogNet >> version [
	<doc: 'Returns the current network id.'>
	^ self send: api messageNetVersion
]
