menu - scopes
debugScopesMenuOn: aBuilder
	<RubSmalltalkCodeMenu>
	<contextMenu>
	aBuilder
		item: 'Collectors';
		selector: #value;
		target: [  ];
		keyText: 't ';
		order: 0;
		iconName: #workspace;
		with: [ self buildCollectorsMenuOn: aBuilder ]