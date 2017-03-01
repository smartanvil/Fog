block
buildBlockBasedTxGasCorrelation: correlation for: blocksToAnalyze
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