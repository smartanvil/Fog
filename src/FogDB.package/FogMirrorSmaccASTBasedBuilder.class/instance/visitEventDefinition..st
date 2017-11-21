visiting
visitEventDefinition: aSolEventDefinitionNode 
	| event | 
	event := FogEventMirror new .
	aSolEventDefinitionNode indexed_param_list acceptVisitor: self. 
	
	event name: 	aSolEventDefinitionNode event_id value .
	
	event.
	self events add: event. 