as yet unclassified
extractMethodLookup
	| extractor |
	extractor := FogEVMMethodLookUpExtractor new.
	workingOn accept: extractor.
	lookUpTable := extractor lookUpTable