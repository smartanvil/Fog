*FogDB
functionDefinitions
	^ self contract_sources select:[ : c | c class kind = #'function-definition' ]