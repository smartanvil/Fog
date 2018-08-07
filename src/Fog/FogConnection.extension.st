Extension { #name : #FogConnection }

{ #category : #'*Fog' }
FogConnection >> nonCachedSession [
	^ FogSession new
		initializeWith: self;
		yourself
]

{ #category : #'*Fog' }
FogConnection >> session [
	^ FogCachedSession new
		initializeWith: self;
		yourself
]
