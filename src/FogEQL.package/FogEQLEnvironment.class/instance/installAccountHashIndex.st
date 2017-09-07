initialization
installAccountHashIndex
	indexRegistry
		at: FogEQLAccountHashIndex
		put:
			(FogEQLAccountHashIndex
				on: [ (FLMaterializer
						materializeFromFileNamed: (FileLocator indexFolder / 'account-movements.fl') fullName)
						select: [ :i | i isNotNil ] ])