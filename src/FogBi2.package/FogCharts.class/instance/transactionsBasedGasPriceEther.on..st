block
transactionsBasedGasPriceEther: transactions on: aView
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