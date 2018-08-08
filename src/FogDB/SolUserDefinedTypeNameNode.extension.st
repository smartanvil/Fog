Extension { #name : #SolUserDefinedTypeNameNode }

{ #category : #'*FogDB' }
SolUserDefinedTypeNameNode >> isUserDefined [
	^ false 
]

{ #category : #'*FogDB' }
SolUserDefinedTypeNameNode class >> kind [
	^ #declaration
]
