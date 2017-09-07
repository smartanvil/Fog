initialization
installTimestampIndex
	indexRegistry
		at: FogEQLStampIndex
		put:
			(FogEQLStampIndex
				on: [ (FLMaterializer materializeFromFileNamed: (FileLocator indexFolder / 'stampIndex.fl') fullName) select: [ :i | i isNotNil ] ])