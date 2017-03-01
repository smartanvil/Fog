block
buildBlockBasedAccountsByKindPie: pie for: blocksToAnalyze
	| es |
	pie interaction popup.
	pie
		objects:
			(((blocksToAnalyze flatCollect: #accounts) groupedBy: #class) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: asoc key kindOfAccount;
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