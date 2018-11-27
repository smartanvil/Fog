"
Subject to filter. Is composable with the and / or objects 
"
Class {
	#name : #FogFilterTopic,
	#superclass : #Object,
	#instVars : [
		'subject'
	],
	#classInstVars : [
		'any'
	],
	#category : 'FogComm-Transfer-Filters'
}

{ #category : #'as yet unclassified' }
FogFilterTopic class >> any [
	^ FogNullFilter new
]

{ #category : #'as yet unclassified' }
FogFilterTopic class >> subject: aString [
	^ self new
		subject: aString;
		yourself
]

{ #category : #'as yet unclassified' }
FogFilterTopic class >> subject: aSubjectName or: anOtherSubjectName [
	^ (self subject: aSubjectName) or: (self subject: anOtherSubjectName)
]

{ #category : #'as yet unclassified' }
FogFilterTopic >> and: aETHFilterTopic [
	^ FogFilterChainAnd new
		a: self;
		b: aETHFilterTopic;
		yourself
]

{ #category : #'as yet unclassified' }
FogFilterTopic >> forTransfer [
	^ { subject }
]

{ #category : #'as yet unclassified' }
FogFilterTopic >> or: aETHFilterTopic [
	^ FogFilterChainOr new
		a: self;
		b: aETHFilterTopic;
		yourself
]

{ #category : #accessing }
FogFilterTopic >> subject: aString [
	subject := aString
]
