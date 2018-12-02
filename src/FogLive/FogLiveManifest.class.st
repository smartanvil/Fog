"
FogLive is a project that aims to provide object reifications for each of the main concepts in Ethereum. 

FogLive allows to use Blocks, Transactions, Accounts and Contracts as objects, providing along side a Meta programming layer that allows many levels of abstraction going from protocol level and memory access to Contract transparent proxies.



"
Class {
	#name : #FogLiveManifest,
	#superclass : #PackageManifest,
	#category : #'FogLive-Cache'
}

{ #category : #'a- examples' }
FogLiveManifest class >> exampleCreateACachedSession [
	<example>
	| session |
	session := FogConnection createDefaultConnection session
]

{ #category : #'a- examples' }
FogLiveManifest class >> exampleCreateASession [
	<example>
	| session | 
	session := FogConnection createDefaultConnection nonCachedSession .
]

{ #category : #'a- examples' }
FogLiveManifest class >> exampleSetUpDefaultApplicationAccount [
	<example>
	| session |
	session := FogConnection createDefaultConnection nonCachedSession.
	session applicationAccount: (session createExternalAccountFor: '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0')
]
