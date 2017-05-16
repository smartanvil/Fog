access db - contract
findFileContractDescriptionByName: aString
	| entry |
	entry := {aString asFileReference.
	(FileLocator contractsFolder / (aString , '.sol'))} detect: [ :f | f exists ] ifNone: [ self error: ' ' , aString , ' is not a valid contract name or file path' ].
	^ self  findContractDescriptionForFileReference: entry