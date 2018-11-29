Extension { #name : #SolUserDefinedTypeNameNode }

{ #category : #'*FogLive' }
SolUserDefinedTypeNameNode >> isUserDefined [
	^ false 
]

{ #category : #'*FogLive' }
SolUserDefinedTypeNameNode class >> kind [
	^ #declaration
]
