Class {
	#name : #BaselineOfFogComm,
	#superclass : #BaselineOf,
	#category : #BaselineOfFogComm
}

{ #category : #baselines }
BaselineOfFogCommunication >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'TaskItShell' with: [ spec repository: 'github://sbragagnolo/taskit' ].
			spec
				project: 'NeoJSON'
				with: [ spec
						className: #ConfigurationOfNeoJSON;
						version: #stable;
						repository: 'http://mc.stfx.eu/Neo' ].
			spec baseline: 'ParametrizedTests' with: [ spec repository: 'github://tesonep/ParametrizedTests' ].
			spec package: #FogComm with: [ spec requires: #('TaskItShell') ].
			spec package: #FogCommTests with: [ spec requires: #('FogComm' 'ParametrizedTests') ] ]
]
