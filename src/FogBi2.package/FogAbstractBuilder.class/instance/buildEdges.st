edges
buildEdges
	| bool eb |
	bool := lineShape shape attachPoint isInverted.
	lineShape verticalAttachPoint.
	lineShape shape attachPoint inverted: bool.
	eb := RTEdgeBuilder new.
	eb view: view.
	eb objects: classes.
	eb shape shape: lineShape shape.
	eb connectFrom: self superclass.
	"eb connectFrom: self superclass to: #yourself."
	
	eb := RTEdgeBuilder new.
	eb view: view.
	eb elements: view elements.
	
	self edges do: [ :asso |
		eb shape shape: asso key.
		asso value value: eb.
		 ].