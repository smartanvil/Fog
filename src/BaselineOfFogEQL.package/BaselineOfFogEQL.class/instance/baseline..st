baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: #FogDB with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec baseline: #EQL with: [ spec repository: 'github://sbragagnolo/EQL/pharo' ].
			spec baseline: #Xtreams with: [ spec repository: 'github://sbragagnolo/xtreams' ].
			spec package: #FogEQL with: [ spec requires: #('EQL' 'FogDB' 'Xtreams') ].
			spec package: #FogEQLTests with: [ spec requires: #('FogEQL') ] ]