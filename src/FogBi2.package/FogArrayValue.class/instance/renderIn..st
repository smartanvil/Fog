as yet unclassified
renderIn: aView
	| builder |
	[ builder := self builderInstance.
	^ builder
		addObjects: value;
		renderIn: aView ]
		on: Error
		do: [ :error | 
			value size = 0
				ifTrue: [ UIManager default alert: 'There is no item to browse' ] ]