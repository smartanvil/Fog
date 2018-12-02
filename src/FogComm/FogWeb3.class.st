"
FogWeb3API relative 
"
Class {
	#name : #FogWeb3,
	#superclass : #FogAPIAccess,
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogWeb3 >> clientVersion [
	<doc: 'Returns the current client version.'>
	^ self send: api messageClientVersion
]

{ #category : #'as yet unclassified' }
FogWeb3 >> setApi [
	api := FogWeb3API new
]

{ #category : #'as yet unclassified' }
FogWeb3 >> sha3: aString [
	<doc: 'Returns Keccak-256 (<em>not</em> the standardized SHA3-256) of the given data.'>
	^ self send: (api messageSha3: aString)
]

{ #category : #'as yet unclassified' }
FogWeb3 >> sha3_256: aString [
	<doc: 'Returns Keccak-256. Resolved locally, using Keccak project.'>
	^ Keccak hashEncode: aString
]
