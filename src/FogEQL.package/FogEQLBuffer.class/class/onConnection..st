as yet unclassified
onConnection: connection
	^ self new
		connection: connection;
		environment: connection environment;
		yourself