visiting
acceptVisitor: aFogEQLStreamBuilder
	^ FogEQLIntersectProjectionStream new
		firstCollection: (firstCollection acceptVisitor: aFogEQLStreamBuilder);
		secondCollection: (secondCollection acceptVisitor: aFogEQLStreamBuilder);
		yourself