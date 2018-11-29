Extension { #name : #FogConnection }

{ #category : #'*FogLive' }
FogConnection >> nonCachedSession [
	^ FogSession new
		initializeWith: self;
		yourself
]

{ #category : #'*FogLive' }
FogConnection >> session [
	^ FogCachedSession new
		initializeWith: self;
		yourself
]
