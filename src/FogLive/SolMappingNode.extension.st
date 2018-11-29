Extension { #name : #SolMappingNode }

{ #category : #'*FogLive' }
SolMappingNode >> isUserDefined [
	^ false
]

{ #category : #'*FogLive' }
SolMappingNode class >> kind [
	^ #'type-definition'
]
