as yet unclassified
property: aPropertyName subproperty: aSubPropertyName compare: anOperation value: aFogStreamsValue
	^ FogStreamsSubpropertyComparisionCriteria new
		property: aPropertyName;
		subproperty: aSubPropertyName;
		operation: anOperation;
		value: aFogStreamsValue;
		yourself