Extension { #name : #String }

{ #category : #'*FogDB' }
String >> asBKHexa [
	^ self 
]

{ #category : #'*FogDB' }
String >> asHeadlessHexa [
	^ self copyReplaceAll: '0x' with: ''
]
