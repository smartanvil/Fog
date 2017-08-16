as yet unclassified
property: aPropertyName compare: anOperation value: aValuable
	^ FogEQLPropertyComparisionCriteria new
		property: aPropertyName;
		operation: anOperation;
		value: aValuable;
		yourself