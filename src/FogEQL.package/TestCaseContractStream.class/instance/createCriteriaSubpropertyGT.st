initialization
createCriteriaSubpropertyGT
	^ FogEQLCriteria
		property: #account
		subproperty: #ether
		compare: #>
		value: 23 wei