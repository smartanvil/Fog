*FogBi2
bi2Properties
	^ {(FogValue new
		name: #Full;
		value: [ self isFull ]).
	(FogValue new
		name: #'Gas used';
		value: [ self gasUsed ]).
	(FogValue new
		name: #'Mined by';
		value: [ self miner ]).
	(FogValue new
		name: #Nonce;
		value: [ self nonce ]).
	(FogValue new
		name: #Number;
		value: [ self number ]).
	(FogValue new
		name: #Hash;
		value: [ self privateBlockHash ]).
	(FogValue new
		name: #Size;
		value: [ self size ]).
	(FogValue new
		name: #Parent;
		value: [ self parent ]).
	(FogBkArrayValue new
		name: #Uncles;
		value: [ self uncles ]).
	(FogValue new
		name: #Difficulty;
		value: [ self difficulty ]).
	(FogValue new
		name: #Time;
		value: [ self timestamp ]).
	(FogTxArrayValue new
		name: #Transactions;
		value: [ self transactions ])}