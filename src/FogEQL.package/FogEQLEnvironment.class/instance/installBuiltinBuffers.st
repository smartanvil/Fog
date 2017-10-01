initialization
installBuiltinBuffers
	| contractNameSpace brief |
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
	namedbuffers at: #transactions put: (FogEQLTransactionsBuffer onConnection: connection).
	namedbuffers at: #connections put: connections.
	namedbuffers at: #indexes put: indexTags .
	brief := namedbuffers associations
		inject: OrderedCollection new
		into: [ :col :each | 
			each value isDictionary
				ifTrue: [ col addAll: (each value keys collect: [ :k | (each key , '.' , k) asSymbol ]) ]
				ifFalse: [ col add: each key ].
			col ].
	namedbuffers at: #buffers put: brief