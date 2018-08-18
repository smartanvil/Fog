Class {
	#name : #BaselineOfFogCommunication,
	#superclass : #BaselineOf,
	#category : #BaselineOfFogCommunication
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
			spec package: #FogCommunication with: [ spec requires: #('TaskItShell') ].
			spec package: #FogCommunicationTests with: [ spec requires: #('FogCommunication' 'ParametrizedTests') ] ]
]
