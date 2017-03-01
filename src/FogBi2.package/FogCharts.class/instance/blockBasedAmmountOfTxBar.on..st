block
blockBasedAmmountOfTxBar: blocksToAnalyze on: aView
	| bar |
	bar := RTGrapher new.
	bar view: aView.
	^ self buildBlockBasedAmmountOfTxBar: bar for: blocksToAnalyze