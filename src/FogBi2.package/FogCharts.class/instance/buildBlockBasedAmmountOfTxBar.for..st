block
buildBlockBasedAmmountOfTxBar: bar for: blocksToAnalyze
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