block
blockBasedMinersPie: blocksToAnalyze on: aView
	| pie |
	pie := RTPieBuilder new.
	pie view: aView.
	^ self buildBlockBasedMinersPie: pie for: blocksToAnalyze