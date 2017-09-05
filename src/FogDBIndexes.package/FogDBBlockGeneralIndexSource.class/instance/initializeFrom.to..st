initialization
initializeFrom: aFrom to: aTo 
	from := aFrom.
	to := aTo. 
"	txs := OrderedCollection new: (aTo - aFrom) * 5 ."
	blocks := OrderedCollection new: (aTo - aFrom).
	(aTo - aFrom) timesRepeat: [ blocks add: FogDBNonInstalled instance ].