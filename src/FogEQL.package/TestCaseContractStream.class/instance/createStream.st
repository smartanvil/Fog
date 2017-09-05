initialization
createStream
	| newStream |
	newStream := FogEQLContractStream new.
	newStream source: self createSource.
	newStream where: (self createTypeCriteria and: (self criteriaPropertyEquals and: self createCriteriaSubpropertyGT)).
	newStream orderedBy: self createOrderBy.
	newStream limit: 10