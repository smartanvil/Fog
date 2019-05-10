"
Object/ class broker of file locations and other configurations 
"
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
	<doc: 'It returns the location of the compiling folder. For compiling solidity files'>
	^ fogCompilingFolder ifNil: [ fogCompilingFolder := (self fogFolder / #compiling) ensureCreateDirectory ]
]

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogFolder [
	<doc: 'It returns the location of the Fog folder. Umbrella of the rest of folders'>
	^ fogfolder ifNil: [ fogfolder := (FileLocator imageDirectory / #'pharo-local' / #fog) ensureCreateDirectory ]
]

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogTempFolder [
	<doc: 'It returns the location of the temp folder. used for generating files for compilation'>
	^ fogTempFolder ifNil: [ fogTempFolder := (self fogFolder / #temp) ensureCreateDirectory ]
]

{ #category : #'as yet unclassified' }
FogConfiguration class >> fogTestFolder [
	<doc: 'It returns the location of the test folder. Used during tests for generating files'>
	^ fogTestFolder ifNil: [ fogTestFolder := (self fogFolder / #tests) ensureCreateDirectory ]
]
