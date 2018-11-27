Extension { #name : #OrderedCollection }

{ #category : #'*FogDB' }
OrderedCollection >> acceptVisitor: aVisitor [ 
	^ self collect: [ : n | n acceptVisitor: aVisitor ]
]
