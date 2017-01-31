baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'FogDB' with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec package: #FogBi2 with: [ spec requires: #('FogDB') ] ]
