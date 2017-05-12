creation
createBlockFor: dataSource full: isFull
	^ FogBlock new
		source: dataSource;
		full: isFull;
		yourself