*FogDB
findFolderInHierarchy: aFolderName
	| folder |
	folder := self image resolve.
	[ (folder isDirectory
		and: [ folder entries anySatisfy: [ :e | e basename = aFolderName ] ])
		or: [ folder basename = #/ ] ] whileFalse: [ folder := folder parent ].
	(folder / aFolderName) exists
		ifFalse: [ self error: 'index folder not found' ].
	^ folder / aFolderName