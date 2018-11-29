"
Admin subset of RPC calls 
"
Class {
	#name : #FogAdminAPI,
	#superclass : #Object,
	#category : 'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogAdminAPI >> messageGetContractInfo: aContractAddress [
	^ FogMessage new
		method: 'admin_getContractInfo';
		parameters:
			{aContractAddress};
		yourself
]
