Extension { #name : #FogBlock }

{ #category : #'*FogBi2' }
FogBlock >> bi2Properties [
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
]

{ #category : #'*FogBi2' }
FogBlock >> gtBlockCharting: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite roassal2
		title: 'Stats';
		initializeView: [ FogCharts new blockBasedMultiChart: {self} ]
]

{ #category : #'*FogBi2' }
FogBlock >> gtBlockInspection: composite [
	<gtInspectorPresentationOrder: 0>
	FogInspection new inspect: self asTableInto: composite
]
