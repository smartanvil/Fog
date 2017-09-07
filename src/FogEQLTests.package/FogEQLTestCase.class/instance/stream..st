accessing
stream: aQuery
	^ FogEQLStreamBuilder buildStream: (FogEQLSemanticTreeBuilder buildSemanticTree: aQuery)
	