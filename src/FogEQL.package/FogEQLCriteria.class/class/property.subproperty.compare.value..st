as yet unclassified
property: aPropertyName subproperty: aSubPropertyName compare: anOperation value: aFogStreamsValue
	^ FogEQLSubpropertyComparisionCriteria new
		property: aPropertyName;
		subproperty: aSubPropertyName;
		operation: anOperation;
		value: aFogStreamsValue;
		yourself