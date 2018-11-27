Extension { #name : #SolMappingTypeNameNode }

{ #category : #'*FogDB' }
SolMappingTypeNameNode >> isUserDefined [
	^ false 
]

{ #category : #'*FogDB' }
SolMappingTypeNameNode class >> kind [
	^ #declaration
]
