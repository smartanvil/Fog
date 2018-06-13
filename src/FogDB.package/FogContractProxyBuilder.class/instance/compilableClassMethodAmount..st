building methods
compilableClassMethodAmount: aFogMethodMirror
	| variables |
	variables := '{' , (' . ' join: aFogMethodMirror parameters variables) , '}'.
	^ '{1} amount: anAmountOfWeiToTransmitToTheContractOnDeploy
	| instance |
	instance := (self mirror method: #{2}) applyOn: self contractDescription valueWithArguments: {3} from: self session sessionAccount amount: anAmountOfWeiToTransmitToTheContractOnDeploy.
	^ self forInstance: (bind waitIsReady; yourself) at: #latest.
'
		format:
			{aFogMethodMirror selectorWithNames.
			aFogMethodMirror selector.
			variables}