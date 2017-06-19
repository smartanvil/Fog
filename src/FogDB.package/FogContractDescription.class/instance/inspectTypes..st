gttools
inspectTypes: composite
	<gtInspectorPresentationOrder: 1>
	composite table
		title: 'Types';
		display: [ self mirror types ];
		column: 'Name' evaluated: #name;
		column: 'Definition' evaluated: #value;
		send: #value