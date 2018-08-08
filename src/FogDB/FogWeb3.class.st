"
ETHWeb3API relative 
"
Class {
	#name : #FogWeb3,
	#superclass : #FogAPIAccess,
	#category : 'FogDB-API'
}

{ #category : #'as yet unclassified' }
FogWeb3 >> clientVersion [
	^ self send: api messageClientVersion
]

{ #category : #'as yet unclassified' }
FogWeb3 >> setApi [
	api := FogWeb3API new
]

{ #category : #'as yet unclassified' }
FogWeb3 >> sha3: aString [
	^ self send: (api messageSha3: aString)
]

{ #category : #'as yet unclassified' }
FogWeb3 >> sha3_256: aString [
	^ Keccak hashEncode: aString
]
