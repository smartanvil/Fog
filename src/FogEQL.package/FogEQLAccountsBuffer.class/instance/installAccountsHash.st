as yet unclassified
installAccountsHash
	indexes
		at: 'hash'
		put:
			(FogEQLAccountHashIndex
				on: [ (FLMaterializer
						materializeFromFileNamed: (FileLocator indexFolder / 'account-movements.fl') fullName)
						select: [ :i | i isNotNil ] ])