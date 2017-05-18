building methods
compilableClassMethod: aFogMethodMirror
	| variables |
	variables := '{' , (' . ' join: aFogMethodMirror parameters variables) , '}'.
	^ '{1}
	^ (self mirror method: #{2}) applyOn: self mirror valueWithArguments: {3} configuration: FogCache current configuration.
'
		format:
			{aFogMethodMirror selectorWithNames.
			aFogMethodMirror selector.
			variables}