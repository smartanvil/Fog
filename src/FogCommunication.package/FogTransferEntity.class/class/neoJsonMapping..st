as yet unclassified
neoJsonMapping: mapper
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #jsonrpc;
				mapAccessor: #id;
				mapAccessor: #method;
				mapAccessor: #parameters to: #params ]