as yet unclassified
neoJsonMapping: mapper
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #fromBlock;
				mapAccessor: #toBlock;
				mapAccessor: #address to: #address;
				mapAccessor: #generateTopicsForTransfer to: #topics ]