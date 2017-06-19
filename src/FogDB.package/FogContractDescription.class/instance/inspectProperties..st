gttools
inspectProperties: composite
	<gtInspectorPresentationOrder: 3>
	composite table
		title: 'Properties';
		display: [ self mirror instanceMirror properties ];
		column: 'Name' evaluated: #name;
		column: 'Definition' evaluated: #value;
		send: #value