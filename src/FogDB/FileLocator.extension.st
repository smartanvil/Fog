Extension { #name : #FileLocator }

{ #category : #'*FogDB' }
FileLocator class >> contractsFolder [
	^ self findFolderInHierarchy: #contracts
]

{ #category : #'*FogDB' }
FileLocator class >> etherscanFolder [
	^ self findFolderInHierarchy: #etherscan
]

{ #category : #'*FogDB' }
FileLocator class >> findFolderInHierarchy: aFolderName [
	| folder |
	folder := self image resolve.
	[ (folder isDirectory
		and: [ folder entries anySatisfy: [ :e | e basename = aFolderName ] ])
		or: [ folder basename = #/ ] ] whileFalse: [ folder := folder parent ].
	(folder / aFolderName) exists
		ifFalse: [ self error: 'index folder not found' ].
	^ folder / aFolderName
]

{ #category : #'*FogDB' }
FileLocator class >> indexFolder [
	^ self findFolderInHierarchy: #index
]
