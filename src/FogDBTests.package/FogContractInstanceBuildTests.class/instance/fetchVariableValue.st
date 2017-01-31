as yet unclassified
fetchVariableValue
	^ (connection eth getStorageAt: self contractTest upTo: 1 blockTag: 'latest') asBKNumber