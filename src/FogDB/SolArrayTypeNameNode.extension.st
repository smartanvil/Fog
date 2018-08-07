Extension { #name : #SolArrayTypeNameNode }

{ #category : #'*FogDB' }
SolArrayTypeNameNode >> isUserDefined [
	^ false 
]

{ #category : #'*FogDB' }
SolArrayTypeNameNode class >> kind [
	^ #declaration
]
