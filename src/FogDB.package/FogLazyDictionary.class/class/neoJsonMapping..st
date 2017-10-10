accessing
neoJsonMapping: mapper
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #keyMapping ;
				mapAccessor: #valueMapping ]