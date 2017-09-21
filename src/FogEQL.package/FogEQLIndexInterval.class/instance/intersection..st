enumerating
intersection: aFogEQLIndexInterval
	^ self species = aFogEQLIndexInterval species
		ifTrue: [ self index == aFogEQLIndexInterval index
				ifTrue: [ FogEQLIndexInterval new
						from: (from max: aFogEQLIndexInterval from);
						to: (to min: aFogEQLIndexInterval to);
						index: index ]
				ifFalse: [ self asSortedCollection intersection: aFogEQLIndexInterval asSortedCollection ] ]
		ifFalse: [ self asSortedCollection intersection: (aFogEQLIndexInterval reject: [ : i | i isNil ]) asSortedCollection ]