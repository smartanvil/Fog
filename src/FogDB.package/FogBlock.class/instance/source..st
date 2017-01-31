accessing
source: aCollection
	aCollection keysAndValuesDo: [ :k :v | self perform: (k , ':') asSymbol withArguments: {v} ]