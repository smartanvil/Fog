finalization
finalize
	super finalize.
	monitor kill.
	monitor := nil.
	connection := nil