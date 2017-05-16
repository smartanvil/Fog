cache management
detectFileContractDescriptionsOrNil: aBlock
	^ self contractDescriptions detect: [ :c | c isFileBased and: [ aBlock value: c ] ] ifNone: [ nil ]