*FogBi2
bi2Properties
	^ {(FogValue new
		name: #Timestamp;
		value: [ self block timestamp ]).
	(FogValue new
		name: #From;
		value: [ self from ]).
	(FogValue new
		name: #To;
		value: [ self to ]).
	(FogValue new
		name: #Index;
		value: [ self transactionIndex ]).
	(FogValue new
		name: #Block;
		value: [ self block ])}