visiting
visitSelect: aFogEQLSelect
	| source |
	environment := aFogEQLSelect domain.
	source := aFogEQLSelect from acceptVisitor: self.
	source := self composeSource: source withAstNode: aFogEQLSelect where.
	source := self composeSource: source withAstNode: aFogEQLSelect limit.
	source := self composeSource: source withAstNode: aFogEQLSelect orderBy.
	^ FogEQLProjectionStream new
		source: source; 
		outline:
			(aFogEQLSelect select
				collect: [ :n | 
					FogEQLDataExtractor new
						load: n;
						yourself ]);
		yourself