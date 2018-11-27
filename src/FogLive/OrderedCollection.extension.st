Extension { #name : #OrderedCollection }

{ #category : #'*FogLive' }
OrderedCollection >> acceptVisitor: aVisitor [ 
	^ self collect: [ : n | n acceptVisitor: aVisitor ]
]
