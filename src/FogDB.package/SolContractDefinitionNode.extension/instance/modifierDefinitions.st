*FogDB
modifierDefinitions
	^ self contract_sources select:[ : c | c class kind = #'modifier-definition' ]