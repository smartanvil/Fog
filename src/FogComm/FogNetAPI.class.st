Class {
	#name : #FogNetAPI,
	#superclass : #Object,
	#category : #'FogComm-API'
}

{ #category : #'as yet unclassified' }
FogNetAPI >> messageNetListening [
	^ FogMessage new
		method: 'net_listening';
		yourself
]

{ #category : #'as yet unclassified' }
FogNetAPI >> messageNetVersion [
	^ FogMessage new
		method: 'net_listening';
		yourself
]
