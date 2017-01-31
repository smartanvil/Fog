as yet unclassified
sha3_256: aString
	| command return |
	command := ' echo -n "{1}" | rhash --sha3-256 -' format: {aString}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	^ (return synchronizeTimeout: 20 seconds) readStream upTo: Character space