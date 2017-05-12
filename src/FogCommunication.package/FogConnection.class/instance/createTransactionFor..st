creation
createTransactionFor: dataSource
	^ FogTransaction new
		source: dataSource;
		yourself