*FogDB
indexFolder
	| folder |
	folder := self image resolve.
	[ (folder isDirectory and: [ folder entries anySatisfy: [ :e | e basename = #index ] ])
		or: [ folder basename = #/ ] ] whileFalse: [ folder := folder parent ].
	(folder / #index) exists
		ifFalse: [ self error: 'index folder not found' ].
	^ folder / #index