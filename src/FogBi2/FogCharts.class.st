"
Stats based charts from block point of view and from tx point of view 
"
Class {
	#name : #FogCharts,
	#superclass : #Object,
	#category : 'FogBi2-Charting'
}

{ #category : #block }
FogCharts >> blockBasedAccountsByKindPie: blocksToAnalyze on: aView [
	| pie |
	pie := RTPieBuilder new.
	pie view: aView.
	^ self buildBlockBasedAccountsByKindPie: pie for: blocksToAnalyze
]

{ #category : #block }
FogCharts >> blockBasedAmmountOfTxBar: blocksToAnalyze on: aView [
	| bar |
	bar := RTGrapher new.
	bar view: aView.
	^ self buildBlockBasedAmmountOfTxBar: bar for: blocksToAnalyze
]

{ #category : #transactions }
FogCharts >> blockBasedGasPrice: blocks on: aView [
	| color lineChart points ds dec |
	lineChart := RTGrapher new.
	color := Color red.
	lineChart view: aView.
	points := (blocks groupedBy: [ :b | b timestamp asDateAndHour ]) associations collect: [ :assoc | ((assoc value flatCollect: #transactions) collect: #gasPrice) average asInteger ].
	ds := RTData new.
	ds points: points.
	dec := RTDevVarDecorator new.
	dec
		moveBehind;
		deviation: 0.5;
		color: (color alpha: 0.3);
		points: points.
	ds
		connectUsing:
			(RTLine new
				color: (color alpha: 0.5);
				width: 1).
	lineChart add: ds.
	lineChart addDecorator: dec.
	lineChart
		axisX;
		axisY.
	lineChart build.
	lineChart view @ RTZoomableView.
	^ lineChart view
]

{ #category : #block }
FogCharts >> blockBasedMinersPie: blocksToAnalyze on: aView [
	| pie |
	pie := RTPieBuilder new.
	pie view: aView.
	^ self buildBlockBasedMinersPie: pie for: blocksToAnalyze
]

{ #category : #block }
FogCharts >> blockBasedMultiChart: blocksToAnalyze [
	| composer accountsByKind bar miners correlation txhourday gasPricePerHour |
	composer := RTComposer new.
	composer gap: 35.
	accountsByKind := self blockBasedAccountsByKindPie: blocksToAnalyze on: composer view.
	composer group: #accountsKind.

	"-------"
	bar := self blockBasedAmmountOfTxBar: blocksToAnalyze on: composer view.
	composer group: #amountOfTransactions.

	"-------"
	miners := self blockBasedMinersPie: blocksToAnalyze on: composer view.
	composer group: #distributionOfCredibility.

	"-------"
	correlation := self blockBasedTxGasCorrelation: blocksToAnalyze on: composer view.
	composer group: #difficultyGasCorrelation.

	"-------"
	txhourday := self blockBasedTransactionsPerHourPerDate: blocksToAnalyze on: composer view.
	composer group: #txxHourxDay.
	"-------"
	gasPricePerHour := self blockBasedGasPrice: blocksToAnalyze on: composer view.
	composer group: #gasPricePerHour.
	
	
	composer
		move: #accountsKind onTheRightOf: #distributionOfCredibility;
		move: #amountOfTransactions onTheRightOf: #accountsKind;
		move: #difficultyGasCorrelation onTheRightOf: #amountOfTransactions;
		move: #txxHourxDay below: #distributionOfCredibility;
		move: #gasPricePerHour onTheRightOf: #txxHourxDay;
		nameGroup: #distributionOfCredibility as: 'Mined by';
		nameGroup: #accountsKind as: 'Kinds of accounts';
		nameGroup: #amountOfTransactions as: '#Amount of Tx';
		nameGroup: #difficultyGasCorrelation as: '#Tx x Difficulty';
		nameBelowGroup: #txxHourxDay as: '#Tx x Hour x Day';
		nameBelowGroup: #gasPricePerHour as: '#Gas price x hour x day';
		propagateHighlightToAll.
	^ composer view
]

{ #category : #block }
FogCharts >> blockBasedTransactionsPerHourPerDate: blocksToAnalyze on: aView [
	| correlation |
	correlation := RTGrapher new.
	correlation view: aView.
	^ self buildBlockBasedTransactionsPerHourPerDate: correlation for: blocksToAnalyze
]

{ #category : #block }
FogCharts >> blockBasedTxGasCorrelation: blocksToAnalyze on: aView [
	| correlation |
	correlation := RTGrapher new.
	correlation view: aView.
	^ self buildBlockBasedTxGasCorrelation: correlation for: blocksToAnalyze
]

{ #category : #block }
FogCharts >> buildBlockBasedAccountsByKindPie: pie for: blocksToAnalyze [
	| es |
	pie interaction popup.
	pie
		objects:
			(((blocksToAnalyze flatCollect: #accounts) groupedBy: #class) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: asoc key kindOfAccount;
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie
]

{ #category : #block }
FogCharts >> buildBlockBasedAmmountOfTxBar: bar for: blocksToAnalyze [
	| ds |
	bar extent: 200 @ 150.
	ds := RTData new.
	ds interaction popup.
	ds points: blocksToAnalyze.
	ds y: #amountOfTransactions.
	ds barShape rectangle color: Color lightBlue.
	bar add: ds.
	bar build.
	^ bar
]

{ #category : #block }
FogCharts >> buildBlockBasedMinersPie: pie for: blocksToAnalyze [
	| es |
	pie interaction popup.
	pie
		objects:
			((blocksToAnalyze groupedBy: #miner) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: (asoc key first: 5);
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie
]

{ #category : #block }
FogCharts >> buildBlockBasedTransactionsPerHourPerDate: correlation for: blocksToAnalyze [
	| ds |
	correlation extent: 290 @ 200.
	ds := RTData new.
	ds interaction popup.
	ds dotShape ellipse
		size: 15;
		color: (Color red alpha: 0.3).
	ds points: blocksToAnalyze.
	ds
		y: [ :block | block timestamp hours ];
		x: [ :block | block timestamp dayOfYear ].

	"ds
		dotSize: #amountOfTransactions
		min: 4
		max: 60
		using: #sqrt."
	ds highlightIf: [ :cls | cls amountOfTransactions > 40 ] using: #number.
	correlation add: ds.
	correlation maxX: 100.
	correlation maxY: 24.
	correlation build.
	^ correlation
]

{ #category : #block }
FogCharts >> buildBlockBasedTxGasCorrelation: correlation for: blocksToAnalyze [
	| gasFactor ds |
	gasFactor := (100 / ((blocksToAnalyze collect: #gasUsed) max max: 1)) asFloat.
	correlation extent: 290 @ 200.
	ds := RTData new.
	ds interaction popup.
	ds dotShape ellipse
		size: 15;
		color: (Color red alpha: 0.3).
	ds points: blocksToAnalyze.
	ds
		y: [ :block | block amountOfTransactions ];
		x: [ :block | block gasUsed * gasFactor ].
	ds highlightIf: [ :cls | cls amountOfTransactions > 40 ] using: #number.
	correlation add: ds.
	correlation maxX: 100.
	correlation maxY: 100.
	correlation build.
	^ correlation
]

{ #category : #transactions }
FogCharts >> transactionBasedAccountsByFromKindPie: transactions on: aView [
	| pie es |
	pie := RTPieBuilder new.
	pie view: aView.
	pie interaction popup.
	pie
		objects:
			(((transactions collect: #from) groupedBy: #class) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: asoc key kindOfAccount;
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie
]

{ #category : #transactions }
FogCharts >> transactionBasedAccountsByToKindPie: transactions on: aView [
	| pie es |
	pie := RTPieBuilder new.
	pie view: aView.
	pie interaction popup.
	pie
		objects:
			(((transactions collect: #to) groupedBy: #class) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: asoc key kindOfAccount;
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie
]

{ #category : #transactions }
FogCharts >> transactionBasedAccountsParticipantsFromPie: transactions on: aView [
	| pie es |
	pie := RTPieBuilder new.
	pie view: aView.
	pie interaction popup.
	pie
		objects:
			((transactions groupedBy: #from) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: (asoc key privateAccountHash first: 5);
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie
]

{ #category : #transactions }
FogCharts >> transactionBasedAccountsParticipantsToPie: transactions on: aView [
	| pie es |
	pie := RTPieBuilder new.
	pie view: aView.
	pie interaction popup.
	pie
		objects:
			((transactions groupedBy: #to) associations
				inject: OrderedCollection new
				into: [ :acc :asoc | 
					acc
						add:
							(FogGroupedEntry new
								kind: (asoc key privateAccountHash first: 5);
								ammount: asoc value size;
								yourself);
						yourself ]).
	es := pie slice: [ :v | v value ammount ].
	pie labeled.
	pie normalizer
		elements: es;
		distinctColor.
	pie build.
	^ pie
]

{ #category : #transactions }
FogCharts >> transactionsBasedEtherOfTxBar: transactions on: aView [
	| bar ds |
	bar := RTGrapher new.
	bar view: aView.
	bar extent: 200 @ 150.
	ds := RTData new.
	ds interaction popup.
	ds points: transactions.
	ds y: #ammount.
	ds barShape rectangle color: Color lightRed .
	bar add: ds.
	bar build.
	^ bar
]

{ #category : #transactions }
FogCharts >> transactionsBasedGasPriceEther: transactions on: aView [
	| correlation ds |
	correlation := RTGrapher new.
	correlation view: aView.
	correlation extent: 290 @ 200.
	ds := RTData new.
	ds interaction popup.
	ds dotShape ellipse
		size: 15;
		color: (Color red alpha: 0.3).
	ds points: transactions.
	ds
		y: [ :block | block gasPrice ];
		x: [ :block | block gas ].
	
	ds
		dotSize: #ammount
		min: 4
		max: 60
		using: #sqrt.

	correlation add: ds.
	correlation maxX: 100.
	correlation maxY: 24.
	correlation build.
	^ correlation
]

{ #category : #transactions }
FogCharts >> transactionsBasedMultiChart: txToAnalyze [
	| composer from to acc txxEther txEtherGasPrice |
	
	composer := RTComposer new.
	composer gap: 100.
	from := self transactionBasedAccountsByFromKindPie: txToAnalyze on: composer view.
	composer group: #BriefFrom.
	to := self transactionBasedAccountsByToKindPie: txToAnalyze on: composer view.
	composer group: #BriefTo.
	acc := self transactionBasedAccountsParticipantsFromPie: txToAnalyze on: composer view.
	composer group: #AccountsFrom.
	acc := self transactionBasedAccountsParticipantsToPie: txToAnalyze on: composer view.
	composer group: #AccountsTo.
	txxEther := self transactionsBasedEtherOfTxBar: txToAnalyze on: composer view.
	composer group: #txEther.
	txEtherGasPrice := self transactionsBasedGasPriceEther: txToAnalyze on: composer view.
	composer group: #txEtherGasPrice.
	composer
		move: #AccountsFrom onTheRightOf: #BriefFrom;
		move: #BriefTo onTheRightOf: #AccountsFrom;
		move: #AccountsTo onTheRightOf: #BriefTo;
		move: #txEther below: #BriefFrom;
		move: #txEtherGasPrice onTheRightOf: #txEther;
		nameGroup: #BriefFrom as: 'From';
		nameGroup: #BriefTo as: 'To';
		nameGroup: #AccountsFrom as: 'Accounts From';
		nameGroup: #AccountsTo as: 'Accounts To';
		nameBelowGroup: #txEther as: 'Ether x Tx ';
		nameBelowGroup: #txEtherGasPrice as: 'Gas x Gas Price x Value';
		propagateHighlightToAll.
	^ composer view
]
