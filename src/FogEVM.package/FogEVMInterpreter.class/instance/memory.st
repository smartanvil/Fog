accessing
memory
	^ memory ifNil: [ memory := FogEVMMemory new  ]