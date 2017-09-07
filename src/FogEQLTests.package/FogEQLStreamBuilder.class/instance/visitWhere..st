as yet unclassified
visitWhere: aFogEQLWhere
	^ FogEQLFilteredResultStream new
		filter: aFogEQLWhere filter;
		yourself