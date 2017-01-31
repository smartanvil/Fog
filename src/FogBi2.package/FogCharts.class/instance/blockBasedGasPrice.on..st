transactions
blockBasedGasPrice: blocks on: aView
	| color lineChart points ds dec |
	lineChart := RTGrapher new.
	color := Color red.
	lineChart view: aView.
	points := (blocks groupedBy: [ :b | b timestamp asDateAndHour ]) associations collect: [ :assoc | ((assoc value flatCollect: #transactions) collect: #gasPrice) average asInteger ].
	ds := RTData new.
	ds points: points.
	dec := RTDevVarDecorator new.
	dec
		moveBehind;
		deviation: 0.5;
		color: (color alpha: 0.3);
		points: points.
	ds
		connectUsing:
			(RTLine new
				color: (color alpha: 0.5);
				width: 1).
	lineChart add: ds.
	lineChart addDecorator: dec.
	lineChart
		axisX;
		axisY.
	lineChart build.
	lineChart view @ RTZoomableView.
	^ lineChart view