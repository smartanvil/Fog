block
blockBasedMinersPie: blocksToAnalyze on: aView
	| pie es |
	pie := RTPieBuilder new.
	pie view: aView.
	pie interaction popup.
	pie
		objects:
			((blocksToAnalyze groupedBy: #miner) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: (asoc key first: 5);
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie