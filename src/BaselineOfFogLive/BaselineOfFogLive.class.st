Class {
	#name : #BaselineOfFogLive,
	#superclass : #BaselineOf,
	#category : 'BaselineOfFogLive'
}

{ #category : #baselines }
BaselineOfFogLive >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'TaskItShell' with: [ spec repository: 'github://sbragagnolo/taskit:dev-1.1' ].
			spec baseline: 'Keccak' with: [ spec repository: 'github://smartanvil/Keccak:v0.1.1/src' ].
			spec baseline: 'FogComm' with: [ spec repository: 'github://smartanvil/Fog/src' ].
			spec baseline: 'SmaccSolidity' with: [ spec repository: 'github://smartanvil/SmaCC-Solidity' ].
			spec baseline: 'ParametrizedTests' with: [ spec repository: 'github://tesonep/ParametrizedTests' ].
			spec package: 'SolidityTestingResources' with: [ spec repository: 'github://smartanvil/SolidityTestingResources' ].
			spec package: 'FogEVM' with: [ spec repository: 'github://smartanvil/FogEVM' ].
			spec
				project: 'NeoJSON'
				with: [ spec
						className: #ConfigurationOfNeoJSON;
						version: #stable;
						repository: 'http://mc.stfx.eu/Neo' ].
			spec package: #FogLive with: [ spec requires: #('FogComm' 'TaskItShell' 'Keccak' 'SmaccSolidity') ].
			spec package: #FogLiveTests with: [ spec requires: #('FogLive' 'FogEVM' 'ParametrizedTests') ] ]
]
