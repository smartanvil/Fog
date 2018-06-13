creation
createTransactionFor: dataSource
	^ FogTransaction new
		source: dataSource;
		session: self;
		yourself