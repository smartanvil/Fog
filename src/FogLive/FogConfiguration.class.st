Class {
	#name : #FogConfiguration,
	#superclass : #Object,
	#classInstVars : [
		'fogfolder',
		'fogTestFolder',
		'fogCompilingFolder',
		'fogTempFolder'
	],
	#category : #'FogLive-Util'
}

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogCompilingFolder [
	^ fogCompilingFolder ifNil: [ fogCompilingFolder := (self fogFolder / #compiling) ensureCreateDirectory ]
]

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogFolder [
	^ fogfolder ifNil: [ fogfolder := (FileLocator imageDirectory / #'pharo-local' / #fog) ensureCreateDirectory ]
]

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogTempFolder [
	^ fogTempFolder ifNil: [ fogTempFolder := (self fogFolder / #temp) ensureCreateDirectory ]
]

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogTestFolder [
	^ fogTestFolder ifNil: [ fogTestFolder := (self fogFolder / #tests) ensureCreateDirectory ]
]
