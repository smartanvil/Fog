accessing
account
	^ account
		ifNil: [ account := FogContractAccount new
				contractBind: self;
				yourself ]