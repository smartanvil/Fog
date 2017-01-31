block
blockBasedAmmountOfTxBar: blocksToAnalyze on: aView
	| bar ds |
	bar := RTGrapher new.
	bar view: aView.
	bar extent: 200 @ 150.
	ds := RTData new.
	ds interaction popup.
	ds points: blocksToAnalyze.
	ds y: #amountOfTransactions.
	ds barShape rectangle color: Color lightBlue.
	bar add: ds.
	bar build.
	^ bar