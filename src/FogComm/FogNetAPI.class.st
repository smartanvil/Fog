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
	<doc:'Encodes a message entity for the RPC message net_listening'>
	^ FogMessage new
		method: 'net_listening';
		yourself
	
]

{ #category : #'as yet unclassified' }
FogNetAPI >> messageNetVersion [   
	<doc:'Encodes a message entity for the RPC message net_version'>
	^ FogMessage new
		method: 'net_version';
		yourself
	
]
