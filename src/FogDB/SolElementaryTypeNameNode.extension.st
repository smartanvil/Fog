Extension { #name : #SolElementaryTypeNameNode }

{ #category : #'*FogDB' }
SolElementaryTypeNameNode >> isUserDefined [
	^ false
]

{ #category : #'*FogDB' }
SolElementaryTypeNameNode class >> kind [
	^ #declaration
]
