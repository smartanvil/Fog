accessing
interval: from to: to
	^ FogEQLIndexInterval new
		from: from;
		to: to;
		index: self;
		yourself