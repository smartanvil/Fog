accessing
getStorageAt: anIndex
	^ dictionary at: anIndex ifAbsent: [ '0x0' ]