accessing
uncles
	^ uncles ifNil: [ uncles := unclesHashes collect: [ :u | self connection findBlockByHash: u full: true ] ]