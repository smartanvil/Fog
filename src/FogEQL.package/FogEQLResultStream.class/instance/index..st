accessing
index: aCollection
	index := aCollection collect: [ :in | in readStream ]