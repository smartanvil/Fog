compiling
asyncCompileSolidity: sourceCodeFile
	| command return compiled compiledStream binary binaryRuntime abi ast tmp2 |
	tmp2 := '/tmp/out{1}.txt' format: {sourceCodeFile hash asString}.
	command := ' cd {3}; solc --abi --bin --bin-runtime {1} >{2}'
		format:
			{sourceCodeFile fullName.
			tmp2.
			sourceCodeFile asFileReference parent fullName}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	^ return