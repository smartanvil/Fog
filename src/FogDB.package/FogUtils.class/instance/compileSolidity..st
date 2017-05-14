as yet unclassified
compileSolidity: tmp
	| command return compiled compiledStream binary binaryRuntime abi ast tmp2 |
	tmp2 := '/tmp/out{1}.txt' format: {tmp hash asString}.
	command := ' cd {3}; solc --abi --bin --bin-runtime {1} >{2}'
		format:
			{tmp fullName.
			tmp2.
			tmp reference parent fullName}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	compiled := return synchronizeTimeout: 10 seconds.
	compiled := tmp2 asFileReference readStream upToEnd.
	compiledStream := (((((compiled copyReplaceAll: String lf with: '') copyReplaceAll: 'Binary of the runtime part:' with: '^')
		copyReplaceAll: 'Binary:'
		with: '^') copyReplaceAll: 'Contract JSON ABI' with: '^') copyReplaceAll: ' ' with: '') readStream.
	compiledStream upTo: $^.
	binary := compiledStream upTo: $^.
	binaryRuntime := compiledStream upTo: $^.
	abi := compiledStream upTo: $^.
	tmp2 asFileReference delete.
	command := ' cd {3}; solc --ast-json {1} 1> {2} '
		format:
			{tmp fullName.
			tmp2.
			tmp reference parent fullName}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	compiled := return synchronizeTimeout: 30 seconds.
	compiledStream := tmp2 asFileReference readStream.
	compiledStream
		upToAll: '=======';
		upToAll: '======='.
	ast := compiledStream upToAll: '======= SimpleStorage ======='.
	^ {(#binary -> binary).
	(#runtime -> binaryRuntime).
	(#abi -> (NeoJSONReader fromString: abi)).
	(#ast -> (NeoJSONReader fromString: ast))} asDictionary