*FogDB
contractsFolder
	| folder |
	folder := self image resolve.
	[ (folder isDirectory and: [ folder entries anySatisfy: [ :e | e basename = #contracts ] ])
		or: [ folder basename = #/ ] ] whileFalse: [ folder := folder parent ].
	(folder / #contracts) exists
		ifFalse: [ self error: 'Contract folder not found' ].
	^ folder / #contracts