*FogBi2
gtBlockCharting: composite
	<gtInspectorPresentationOrder: 0>
	^ composite roassal2
		title: 'Stats';
		initializeView: [ FogCharts new blockBasedMultiChart: {self} ]