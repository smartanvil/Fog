as yet unclassified
intersection: aFogEQLIndexInterval
	^ self species = aFogEQLIndexInterval species
		ifTrue: [ self index == aFogEQLIndexInterval index
				ifTrue: [ FogEQLIndexInterval new
						from: (from max: aFogEQLIndexInterval from);
						to: (to min: aFogEQLIndexInterval to);
						index: index ]
				ifFalse: [ self asSet intersection: aFogEQLIndexInterval asSet ] ]
		ifFalse: [ self asSet intersection: aFogEQLIndexInterval asSet ]