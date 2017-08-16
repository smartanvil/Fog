as yet unclassified
visitSourceList: anEQLSourceListNode 
	^ anEQLSourceListNode sources collect: [ : s | s acceptVisitor: self ]