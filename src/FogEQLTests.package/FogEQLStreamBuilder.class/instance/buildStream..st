as yet unclassified
buildStream: aCollection 
	^ aCollection collect: [ :s | s acceptVisitor: self ]