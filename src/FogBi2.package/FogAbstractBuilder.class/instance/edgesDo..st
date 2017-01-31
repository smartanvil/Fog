edges
edgesDo: aBlock
	| s |
	s := self shape current copy.
	self edges add: s->aBlock.