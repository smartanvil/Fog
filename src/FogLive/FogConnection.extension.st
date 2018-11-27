Extension { #name : #FogConnection }

{ #category : #'*FogDB' }
FogConnection >> nonCachedSession [
	^ FogSession new
		initializeWith: self;
		yourself
]

{ #category : #'*FogDB' }
FogConnection >> session [
	^ FogCachedSession new
		initializeWith: self;
		yourself
]
