as yet unclassified
resolveMirror
	^ (FogContractDescription instances
		detect: [ :c | 
			c name = self contractDescriptionName
				and: [ c versionHash = self versionHash ] ]
		ifNone: [ self
				error:
					'Could not resolve mirror for contract description '
						, self contractDescriptionName ]) mirror