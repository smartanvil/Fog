as yet unclassified
instanceFor: aCurrencyName
	^ instances
		at: aCurrencyName
		ifAbsentPut: [ self new
				unit: aCurrencyName;
				yourself ]