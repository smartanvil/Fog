"
Testing of the Web3 api object 
"
Class {
	#name : #TestEncodingWeb3ToJson,
	#superclass : #FogTestCase,
	#instVars : [
		'web3'
	],
	#category : 'FogCommunicationTests'
}

{ #category : #'as yet unclassified' }
TestEncodingWeb3ToJson >> setUp [
	super setUp.
	web3 := FogWeb3API new.
	
]

{ #category : #'as yet unclassified' }
TestEncodingWeb3ToJson >> testWeb3HashDataEncoded [
	self
		assertEntityFromMessage: (web3 messageSha3: '0x68656c6c6f20776f726c64')
		equalsToJson: '{"jsonrpc":"2.0","method":"web3_sha3","params":["0x68656c6c6f20776f726c64"],"id":1}'
]

{ #category : #'as yet unclassified' }
TestEncodingWeb3ToJson >> testWeb3VersionEncoded [
	self assertEntityFromMessage: web3 messageClientVersion equalsToJson: '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":1}'
]
