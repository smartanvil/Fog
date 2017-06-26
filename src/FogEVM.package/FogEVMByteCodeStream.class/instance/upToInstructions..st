as yet unclassified
upToInstructions: anArrayOfInstructions
	| first |
	first := anArrayOfInstructions first.
	(position max: 1) to: readLimit do: [ :idx | 
		(collection at: idx) instruction = first
			ifTrue: [ ((collection copyFrom: idx to: idx + anArrayOfInstructions size - 1)
					collect: #instruction) asArray = anArrayOfInstructions
					ifTrue: [ ^ self next: idx - position + anArrayOfInstructions size -1 ] ] ].
	self error: ' instructions not founded '