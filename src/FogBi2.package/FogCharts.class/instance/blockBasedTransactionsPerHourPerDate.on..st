block
blockBasedTransactionsPerHourPerDate: blocksToAnalyze on: aView
	| correlation |
	correlation := RTGrapher new.
	correlation view: aView.
	^ self buildBlockBasedTransactionsPerHourPerDate: correlation for: blocksToAnalyze