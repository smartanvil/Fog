creation
createFileContractDescriptionFor: description
	^ FogFileContractDescription new
		binary: (description at: #binary);
		runtime: (description at: #binaryRuntime);
		abi: (description at: #abi);
		ast: (description at: #ast);
		yourself