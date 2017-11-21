*FogDB
eventDefinitions
	^ self contract_sources select:[ : c | c class kind = #'event-definition' ]