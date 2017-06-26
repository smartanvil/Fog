enumerating
select: aCondition
	| finder |
	finder := FogEVMAstFinder new
		condition: aCondition;
		yourself.
	self accept: finder.
	^ finder found