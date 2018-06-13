creation
createBlockFor: dataSource full: isFull
	dataSource ifNil: [ FogError signalInvalidBlockAccess ].
	^ FogBlock new
		source: dataSource;
		session: self;
		full: isFull;
		yourself