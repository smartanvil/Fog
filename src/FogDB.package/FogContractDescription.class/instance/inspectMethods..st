gttools
inspectMethods: composite
	<gtInspectorPresentationOrder: 2>
	composite table
		title: 'Methods';
		display: [ self mirror instanceMirror methods ];
		column: 'Name' evaluated: #name;
		column: 'Selector' evaluated: #selector;
		column: 'Signature' evaluated: #signature;
		column: 'Definition' evaluated: #value;
		send: #value