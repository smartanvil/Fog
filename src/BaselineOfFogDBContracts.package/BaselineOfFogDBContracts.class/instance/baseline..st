baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'FogDB' with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec package: 'Avatar' with: [ spec repository: 'github://guillep/Avatar' ].
			spec package: #FogDBContracts with: [ spec requires: #('FogDB' 'Avatar') ].
			spec package: #FogDBContractsTests with: [ spec requires: #('FogDBContracts') ] ]