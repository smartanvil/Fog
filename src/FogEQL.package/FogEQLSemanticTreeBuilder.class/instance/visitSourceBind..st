as yet unclassified
visitSourceBind: anEQLSourceBindNode
	^ FogEQLBufferSelector new
		binding: (anEQLSourceBindNode binding  acceptVisitor: self);
		selector: (anEQLSourceBindNode buffer_name  acceptVisitor: self);
		yourself .