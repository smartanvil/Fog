as yet unclassified
getStorageAt: anInteger
	^ self connection eth getStorageAt: address upTo: anInteger blockTag: 'latest'