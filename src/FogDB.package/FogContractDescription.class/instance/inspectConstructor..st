gttools
inspectConstructor: composite
	<gtInspectorPresentationOrder: 4>
	composite table
		title: 'Constructor';
		display: [ {self mirror constructor} ];
		column: 'Name' evaluated: #name;
		column: 'Selector' evaluated: #selector;
		column: 'Definition' evaluated: #value;
		send: #value