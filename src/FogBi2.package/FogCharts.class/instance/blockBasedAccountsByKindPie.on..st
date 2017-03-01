block
blockBasedAccountsByKindPie: blocksToAnalyze on: aView
	| pie |
	pie := RTPieBuilder new.
	pie view: aView.
	^ self buildBlockBasedAccountsByKindPie: pie for: blocksToAnalyze