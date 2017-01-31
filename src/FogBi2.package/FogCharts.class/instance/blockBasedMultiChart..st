block
blockBasedMultiChart: blocksToAnalyze
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