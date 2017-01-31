block
blockBasedTransactionsPerHourPerDate: blocksToAnalyze on: aView
	| correlation ds |
	correlation := RTGrapher new.
	correlation view: aView.
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