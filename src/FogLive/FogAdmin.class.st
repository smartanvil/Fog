"
ETHAdminAPI relative 
"
Class {
	#name : #FogAdmin,
	#superclass : #FogAPIAccess,
	#category : 'FogLive-API'
}

{ #category : #'as yet unclassified' }
FogAdmin >> getContractInfo: aContractAddress [
	^ self send: (api messageGetContractInfo: aContractAddress)
]

{ #category : #'as yet unclassified' }
FogAdmin >> setApi [
	api := FogAdminAPI new
]
