visiting
acceptVisitor: aFogEQLStreamBuilder
	^ FogEQLUnionProjectionStream new
		firstCollection: (firstCollection acceptVisitor: aFogEQLStreamBuilder);
		secondCollection: (secondCollection acceptVisitor: aFogEQLStreamBuilder);
		yourself