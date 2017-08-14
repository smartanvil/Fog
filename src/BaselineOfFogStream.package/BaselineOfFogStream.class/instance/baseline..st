baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: #FogDB with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec baseline: #Xtreams with: [ spec repository: 'github://sbragagnolo/xtreams' ].
			spec package: #FogStreams with: [ spec requires: #('FogDB' 'Xtreams') ] ]