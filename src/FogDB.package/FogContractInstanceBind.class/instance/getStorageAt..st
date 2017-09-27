accessing
getStorageAt: anInteger
	<getStorageAt>
	^ self connection eth getStorageAt: address upTo: anInteger blockTag: 'latest'