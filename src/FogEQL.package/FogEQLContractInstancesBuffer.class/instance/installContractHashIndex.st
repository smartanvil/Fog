accessing
installContractHashIndex
	indexes
		at: 'hash'
		put:
			(FogEQLContractInstanceHashIndex
				on: [ (FLMaterializer
						materializeFromFileNamed: (FileLocator indexFolder / 'contracts-activations.fl') fullName)
						select: [ :i | i isNotNil ] ])