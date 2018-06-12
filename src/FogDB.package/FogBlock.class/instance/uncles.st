accessing
uncles
	^ uncles ifNil: [ uncles := unclesHashes collect: [ :u | self session findBlockByHash: u full: true ] ]