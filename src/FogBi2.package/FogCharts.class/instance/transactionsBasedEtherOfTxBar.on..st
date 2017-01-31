block
transactionsBasedEtherOfTxBar: transactions on: aView
	| bar ds |
	bar := RTGrapher new.
	bar view: aView.
	bar extent: 200 @ 150.
	ds := RTData new.
	ds interaction popup.
	ds points: transactions.
	ds y: #value.
	ds barShape rectangle color: Color lightRed .
	bar add: ds.
	bar build.
	^ bar