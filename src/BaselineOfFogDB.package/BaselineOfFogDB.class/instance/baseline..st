baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec baseline: 'TaskItShell' with: [ spec repository: 'github://sbragagnolo/taskit:pre-release-3-scale' ].
			spec baseline: 'FogCommunication' with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			spec baseline: 'FogSolidityAST' with: [ spec repository: 'github://sbragagnolo/Fog/src' ].
			
			spec
				project: 'NeoJSON'
				with: [ spec
						className: #ConfigurationOfNeoJSON;
						version: #stable;
						repository: 'http://mc.stfx.eu/Neo' ].
			
			spec package: #FogDB with: [ spec requires: #('FogSolidityAST' 'FogCommunication' 'TaskItShell' ) ].
			spec package: #FogFBTests with: [ spec requires: #('FogDB') ]. ]
		
	



