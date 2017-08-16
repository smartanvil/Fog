as yet unclassified
substream
	^substream ifNil: [ 
		substream := (filter fetchAll: source) readStream . 
	 ]