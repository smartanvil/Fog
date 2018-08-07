Extension { #name : #SolMappingNode }

{ #category : #'*FogDB' }
SolMappingNode >> isUserDefined [
	^ false
]

{ #category : #'*FogDB' }
SolMappingNode classSide >> kind [
	^ #'type-definition'
]
