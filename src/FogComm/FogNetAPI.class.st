"
Net subset of callable RPC messages 

"
Class {
	#name : #FogNetAPI,
	#superclass : #Object,
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogNetAPI >> messageNetListening [
	<doc: 'Returns <code>true</code> if client is actively listening for network connections.'>
	^ FogMessage new
		method: 'net_listening';
		yourself
]

{ #category : #'as yet unclassified' }
FogNetAPI >> messageNetVersion [  
	<doc:'Returns the current network id.'>
	^ FogMessage new
		method: 'net_version';
		yourself

]
