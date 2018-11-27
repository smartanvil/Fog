Extension { #name : #ByteString }

{ #category : #'*FogDB' }
ByteString >> minus: aString [
	| stream |
	stream := '' writeStream.
	1 to: (self size min: aString size) do: [ :i | 
		(self at: i) = (aString at: i)
			ifTrue: [ stream nextPut: (self at: i) ]
			ifFalse: [ ^ stream contents ] ].
	^ stream contents
]
