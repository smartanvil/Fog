as yet unclassified
visitBlock: aSASTBlock
	| sequence |
	sequence := self createSequence.
	sequence statements: (aSASTBlock statements collect: [ :s | s accept: self ]).
	^ sequence