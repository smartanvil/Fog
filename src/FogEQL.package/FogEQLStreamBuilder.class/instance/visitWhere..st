visiting
visitWhere: aFogEQLWhere
	^ FogEQLFilteredResultStream new
		filter: (aFogEQLWhere filter acceptVisitor: self);
		yourself