as yet unclassified
indexOn: aString
	^ aString accessingLine = 'block.timestamp'
		ifTrue: [ indexes at: 'block.timestamp' ifAbsentPut: [ FogEQLStampIndex on: (FLMaterializer materializeFromFileNamed: '/home/santiago/stampIndex.fl') ] ]
		ifFalse: [ self error: 'There is no index ' ]