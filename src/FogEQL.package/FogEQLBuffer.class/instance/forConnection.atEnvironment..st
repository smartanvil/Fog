clone
forConnection: aConnection atEnvironment: anEnvironment
	^ self clone
		connection: aConnection;
		environment: anEnvironment;
		yourself