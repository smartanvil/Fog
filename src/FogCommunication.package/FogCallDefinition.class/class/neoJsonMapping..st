as yet unclassified
neoJsonMapping: mapper
	mapper
		for: self
		do: [ :mapping | 
			mapping
				mapAccessor: #from;
				mapAccessor: #to;
				mapAccessor: #hexaValue to: #value;
				mapAccessor: #hexaGas to: #gas;
				mapAccessor: #hexaGasPrice to: #gasPrice;
				mapAccessor: #hexaValue to: #value;
				mapAccessor: #data;
				mapAccessor: #hexaNounce to: #nounce ]