private
privateWritableCache: aSymbol
	^ (cache at: aSymbol ifAbsentPut: [ self newCollection ]) 