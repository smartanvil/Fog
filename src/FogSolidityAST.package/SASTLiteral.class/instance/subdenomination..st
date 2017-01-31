as yet unclassified
subdenomination: aSubdenomination
	subdenomination := aSubdenomination.
	self haltIf: [ subdenomination isNotNil ].
	self flag: #WhatIsThis