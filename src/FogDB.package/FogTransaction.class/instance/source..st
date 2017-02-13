accessing
source: aCollection
	source := aCollection.
	source keysAndValuesDo: [ :k :val | self perform: (k , ':') asSymbol withArguments: {val} ]