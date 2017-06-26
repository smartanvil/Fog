as yet unclassified
upToCondition: aCondition
	(position max: 1) to: readLimit do: [ :idx | 
		(aCondition value: (collection at: idx))
			ifTrue: [ ^ self next: idx - position ] ].
	self error: ' instructions not found '