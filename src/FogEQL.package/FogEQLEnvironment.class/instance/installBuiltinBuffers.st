initialization
installBuiltinBuffers
	connection := FogConnection currentConnection.
	namedbuffers at: #contract_instances put: (FogEQLContractInstancesBuffer onConnection: connection).
	namedbuffers
		at: #contract_descriptions
		put:
			((FogEQLContractBuffer onConnection: connection)
				directory: FileLocator contractsFolder;
				yourself).
	namedbuffers at: #contract_activations put: (FogEQLContractInstancesBuffer onConnection: connection).
	namedbuffers at: #blocks put: (FogEQLBlocksBuffer onConnection: connection).
	namedbuffers at: #accounts put: (FogEQLAccountsBuffer onConnection: connection).
	namedbuffers at: #transactions put: (FogEQLTransactionsBuffer onConnection: connection)