accessing
installTimestampIndex
	indexes
		at: 'timestamp'
		put:
			(FogEQLStampIndex
				on:
					[ (FLMaterializer materializeFromFileNamed: '/home/santiago/stampIndex.fl')
						select: [ :i | i isNotNil ] ])