Class {
	#name : #FogError,
	#superclass : #Error,
	#category : 'FogCommunication-Connection'
}

{ #category : #'as yet unclassified' }
FogError class >> signalInvalidBlockAccess [
	self signal: 'The block accessed does not exist! Are you connected to the proper client?'.
]
