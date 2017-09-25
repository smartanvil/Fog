initialization
installBuiltinBuffers
	| contractNameSpace |
	contractNameSpace := Dictionary new.
	contractNameSpace at: #instances put: (FogEQLContractInstancesBuffer onConnection: connection).
	contractNameSpace
		at: #descriptions
		put:
			((FogEQLContractBuffer onConnection: connection)
				directory: FileLocator contractsFolder;
				yourself).
	contractNameSpace at: #activations put: (FogEQLContractInstancesBuffer onConnection: connection).
	namedbuffers at: #contract put: contractNameSpace.
	namedbuffers at: #blocks put: (FogEQLBlocksBuffer onConnection: connection).
	namedbuffers at: #accounts put: (FogEQLAccountsBuffer onConnection: connection).
	namedbuffers at: #transactions put: (FogEQLTransactionsBuffer onConnection: connection)