"
Web3 subset of callable RPC messages 
https://github.com/ethereum/wiki/wiki/JSON-RPC#json-rpc-api-reference
"
Class {
	#name : #FogWeb3API,
	#superclass : #Object,
	#category : #'FogComm-API'
}

{ #category : #'api web3' }
FogWeb3API >> messageClientVersion [
	<doc: 'Returns the current client version.'>
	^ FogMessage new
		method: 'web3_clientVersion';
		yourself
]

{ #category : #'as yet unclassified' }
FogWeb3API >> messageSha3: aString [  
	<doc: 'Returns Keccak-256 (<em>not</em> the standardized SHA3-256) of the given data.'>
	^ FogMessage new
		method: 'web3_sha3';
		parameters: {aString};
		yourself

]
