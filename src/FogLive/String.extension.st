Extension { #name : #String }

{ #category : #'*FogLive' }
String >> asHeadlessHexa [
	^ self copyReplaceAll: '0x' with: ''
]

{ #category : #'*FogLive' }
String >> minus: aString [
	| index to |
	^ aString
		ifNil: [ '' ]
		ifNotNil: [ to := aString size min: self size.
			index := 1.
			[ (self at: index) = (aString at: index) ] whileTrue: [ index := index + 1 ].
			self copyFrom: index to: self size ]
]
