Class {
	#name : #BaselineOfFogComm,
	#superclass : #BaselineOf,
	#category : #BaselineOfFogComm
}

{ #category : #baselines }
BaselineOfFogComm >> baseline: spec [
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
			spec package: #Hexadecimal with: [ spec repository: 'github://sbragagnolo/Hexadecimal' ].
			spec baseline: 'Equals' with: [ spec repository: 'github://bouraqadi/PharoMisc' ].
			spec baseline: 'ParametrizedTests' with: [ spec repository: 'github://tesonep/ParametrizedTests' ].
			spec baseline: 'Pragmatic' with: [ spec repository: 'github://sbragagnolo/Pragmatic' ].
			spec package: #FogComm with: [ spec requires: #('TaskItShell' 'Pragmatic' 'Equals' 'Hexadecimal') ].
			spec package: #FogCommTests with: [ spec requires: #('FogComm' 'ParametrizedTests') ] ]
]
