as yet unclassified
visitSourceBind: anEQLSourceBindNode
	^ FogEQLNamedDatasourceProxy new
		binding: anEQLSourceBindNode binding value;
		selector: anEQLSourceBindNode buffer_name value;
		yourself .