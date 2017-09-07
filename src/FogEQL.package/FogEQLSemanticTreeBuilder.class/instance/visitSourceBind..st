as yet unclassified
visitSourceBind: anEQLSourceBindNode
	^ FogEQLBufferSelector new
		binding: anEQLSourceBindNode binding value;
		selector: anEQLSourceBindNode buffer_name value;
		yourself .