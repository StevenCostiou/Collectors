main menu
collectorMenuOn: aBuilder
	<RubSmalltalkCodeMenu>
	<contextMenu>
	aBuilder
		item: 'Collect';
		selector: #value;
		target: [  ];
		keyText: 't ';
		order: 0;
		iconName: #history;
		with: [ self buildCollectorsMenuOn: aBuilder ]