"
Web3 subset of callable RPC messages 

"
Class {
	#name : #FogWeb3API,
	#superclass : #Object,
	#category : #'FogComm-API'
}

{ #category : #'api web3' }
FogWeb3API >> messageClientVersion [ 
	<doc:'Encodes a message entity for the RPC message web3_clientVersion'>
	^ FogMessage new
		method: 'web3_clientVersion';
		yourself
	
]

{ #category : #'as yet unclassified' }
FogWeb3API >> messageSha3: aString [   
	<doc:'Encodes a message entity for the RPC message web3_sha3'>
	^ FogMessage new
		method: 'web3_sha3';
		parameters: {aString};
		yourself
	
]
