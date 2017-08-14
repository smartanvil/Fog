initialization
createCriteriaSubpropertyGT
	^ FogStreamsCriteria
		property: #account
		subproperty: #ether
		compare: #>
		value: 23 wei