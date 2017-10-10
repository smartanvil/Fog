baselines
baseline: spec
	<baseline>
	spec 
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'Enma' with: [ spec repository: 'github://sbragagnolo/Enma/src' ].
			spec baseline: 'FogCommunication' with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec baseline: 'FogDB' with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec baseline: 'SmartShackle' with: [ spec repository: 'github://sbragagnolo/SmartShackle/src' ].
			spec package: #Fog with: [ spec requires: #(FogCommunication FogDB SmartShackle Enma) ] ]
