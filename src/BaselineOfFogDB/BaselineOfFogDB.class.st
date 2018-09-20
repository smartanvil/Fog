Class {
	#name : #BaselineOfFogDB,
	#superclass : #BaselineOf,
	#category : 'BaselineOfFogDB'
}

{ #category : #baselines }
BaselineOfFogDB >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'TaskItShell' with: [ spec repository: 'github://sbragagnolo/taskit' ].
			spec baseline: 'Keccak' with: [ spec repository: 'github://smartshackle/Keccak:v0.1.1/src' ].
			spec baseline: 'FogCommunication' with: [ spec repository: 'github://smartshackle/Fog/src' ].
			spec baseline: 'SmaccSolidity' with: [ spec repository: 'github://smartshackle/SmaCC-Solidity' ].
			spec baseline: 'ParametrizedTests' with: [ spec repository: 'github://tesonep/ParametrizedTests' ].
			spec
				project: 'NeoJSON'
				with: [ spec
						className: #ConfigurationOfNeoJSON;
						version: #stable;
						repository: 'http://mc.stfx.eu/Neo' ].
			spec package: #FogDB with: [ spec requires: #('FogCommunication' 'TaskItShell' 'Keccak' 'SmaccSolidity') ].
			spec package: #FogDBTests with: [ spec requires: #('FogDB' 'ParametrizedTests') ].
			spec package: #FogEVM with: [ spec requires: #('FogDB') ] ]
]
