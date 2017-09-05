accessing
installTimestampIndex
	indexes
		at: 'timestamp'
		put:
			(FogEQLStampIndex
				on: [ (FLMaterializer
						materializeFromFileNamed: (FileLocator indexFolder / 'stampIndex.fl') fullName)
						select: [ :i | i isNotNil ] ])