initialization
setUp
	super setUp.
	self timeLimit: 3 minutes.
	simpleStorage ifNil: [ simpleStorage := self createContract ]