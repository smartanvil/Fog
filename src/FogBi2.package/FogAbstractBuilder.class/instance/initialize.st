initialization
initialize
	super initialize.
	classesGroup := RTGroup new.
	classes := OrderedCollection new.
	self forETH.
	self initializeLayout.
	self initializeShapeBuilder.
	(self classNameShape: RTShapeBuilder new) label
		height: self fontSizeOfClassname;
		text: [ :c | self classNameFor: c ].
	self methodShape: RTShapeBuilder new.
	self attributeShape: RTShapeBuilder new.
	(self boxShape: RTShapeBuilder new) box
		color: Color white;
		borderColor: Color gray.
	self interaction draggable.
	self prepare: self methodShape selector: #methodselector.
	self prepare: self attributeShape selector: #attributeselector.
	