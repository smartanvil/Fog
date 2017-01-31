gtextention
gtInspeactorBlockchainRoassalBrowse: composite
	<gtInspectorPresentationOrder: 0>
	^ self class relatedBuilder new
		addObject: self;
		gtInspectorViewIn: composite