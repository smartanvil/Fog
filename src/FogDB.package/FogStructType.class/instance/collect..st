testing
collect: aBlock
	^ fields collect: [ :b | aBlock value: b type ]