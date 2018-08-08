Extension { #name : #SolMappingNode }

{ #category : #'*FogDB' }
SolMappingNode >> isUserDefined [
	^ false
]

{ #category : #'*FogDB' }
SolMappingNode class >> kind [
	^ #'type-definition'
]
