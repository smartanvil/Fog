as yet unclassified
wget: anUrl
	| tmp command return |
	tmp := #/ asFileReference / #tmp / anUrl hash asString , '.json'.
	command := ' wget -qO- -O {1} {2}'
		format:
			{tmp fullName.
			anUrl asString}.
	return := [ :spec | 
	spec
		command: 'bash';
		option: '-c';
		argument: command ] asOSTask future.
	return synchronizeTimeout: 20 seconds.
	10
		timesRepeat: [ | ret |
			ret := tmp readStream upToEnd.
			ret size > 0
				ifTrue: [ ^ ret ].
			500 milliSeconds wait ].
	self error: 'Time out looking for ' , anUrl asString