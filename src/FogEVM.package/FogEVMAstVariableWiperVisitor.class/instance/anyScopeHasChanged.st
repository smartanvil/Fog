as yet unclassified
anyScopeHasChanged
	^ readWriteTracker keys anySatisfy: [ :v | v isEVMVariable not ]