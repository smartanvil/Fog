as yet unclassified
property: aPropertyName compare: anOperation value: aValuable
	^ FogStreamsPropertyComparisionCriteria new
		property: aPropertyName;
		operation: anOperation;
		value: aValuable;
		yourself