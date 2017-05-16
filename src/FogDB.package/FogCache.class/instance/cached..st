accessing
cached: aSymbol
	^ (cache at: aSymbol ifAbsentPut: [ self newCollection ]) copy