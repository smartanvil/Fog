"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestFogDBTests,
	#superclass : #PackageManifest,
	#category : 'FogDBTests'
}

{ #category : #'meta-data' }
ManifestFogDBTests class >> description [ ^ 'Test contracts deployed once for the test. It tests Mirror and remote variable access'
]

{ #category : #'code-critics' }
ManifestFogDBTests class >> ruleRBBadMessageRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#FogMirrorCreationFromEtherscanContent #testDescriptionCreation #false)) #'2018-11-21T15:03:01.168945+01:00') )
]
