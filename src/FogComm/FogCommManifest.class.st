"
FogComm project defines the minimal library for accessing to GETH RPC Client. 

Based on the JSON-RPC Specification: 
	https://github.com/ethereum/wiki/wiki/JSON-RPC



"
Class {
	#name : #FogCommManifest,
	#superclass : #PackageManifest,
	#category : #'FogComm-Manifest'
}

{ #category : #'b- examples' }
FogCommManifest class >> exampleAccessBlock [
	<example>
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getBlockByTag: #latest full: true.
]

{ #category : #'b- examples' }
FogCommManifest class >> exampleAccessContract [
	<example>
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getContractCode: '0xcc70db1ac810677c06d9cc1cdd8c953b12edd3fa' blockTag: #latest
]

{ #category : #'b- examples' }
FogCommManifest class >> exampleAccessTransaction [
	<example>
	| connection |
	connection := FogConnection createDefaultConnection.
	^ connection eth getTransactionByHash: '0x576a713667837f7375643c5a5cdc93d5ca7ba15cf96eebc27a523c42debe436e'
]

{ #category : #'a- examples' }
FogCommManifest class >> exampleCreateCustomConnection [
	<example>
	| custom |
	custom := FogConnection on: 'http://localhost:8545'
]

{ #category : #'a- examples' }
FogCommManifest class >> exampleCreateDefaultConnection [
	<example>
	| default |
	default :=FogConnection createDefaultConnection
]
