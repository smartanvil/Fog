"
Web3 subset of callable RPC messages 
"
Class {
	#name : #FogWeb3API,
	#superclass : #Object,
	#category : 'FogCommunication-API'
}

{ #category : #'api web3' }
FogWeb3API >> messageClientVersion [
	^ FogMessage new
		method: 'web3_clientVersion';
		yourself
]

{ #category : #'as yet unclassified' }
FogWeb3API >> messageSha3: aString [
	^ FogMessage new
		method: 'web3_sha3';
		parameters: {aString};
		yourself
]
