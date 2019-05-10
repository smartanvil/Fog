Class {
	#name : #BaselineOfFog,
	#superclass : #BaselineOf,
	#category : 'BaselineOfFog'
}

{ #category : #baselines }
BaselineOfFog >> baseline: spec [
	<baseline>
	spec 
		for: #common
		do: [ spec blessing: #baseline.
			spec baseline: 'Enma' with: [ spec repository: 'github://smartanvil/Enma/src' ].
			spec baseline: 'FogComm' with: [ spec repository: 'github://smartanvil/Fog/src' ].
			spec baseline: 'FogLive' with: [ spec repository: 'github://smartanvil/Fog/src' ].
			spec baseline: 'SmartShackle' with: [ spec repository: 'github://sbragagnolo/SmartShackle/src' ].
			spec package: #Fog with: [ spec requires: #(FogComm FogLive SmartShackle Enma) ] ]

]
