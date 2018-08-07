Extension { #name : #SolUserDefinedTypeNameNode }

{ #category : #'*FogDB' }
SolUserDefinedTypeNameNode >> isUserDefined [
	^ false 
]

{ #category : #'*FogDB' }
SolUserDefinedTypeNameNode classSide >> kind [
	^ #declaration
]
