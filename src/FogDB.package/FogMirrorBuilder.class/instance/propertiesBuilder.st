accessing
propertiesBuilder
	^ FogConnection currentConnection usesSmacc
		ifTrue: [ FogMirrorSmaccASTBasedBuilder new ]
		ifFalse: [ FogMirrorASTBasedBuilder new ]