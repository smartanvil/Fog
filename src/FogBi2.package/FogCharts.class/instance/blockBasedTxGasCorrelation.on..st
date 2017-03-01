block
blockBasedTxGasCorrelation: blocksToAnalyze on: aView
	| correlation |
	correlation := RTGrapher new.
	correlation view: aView.
	^ self buildBlockBasedTxGasCorrelation: correlation for: blocksToAnalyze