actions
load: aConfigurationDictionary
	aConfigurationDictionary asDictionary
		keysAndValuesDo: [ :k :v | self perform: (k , ':') asSymbol withArguments: {v} ]