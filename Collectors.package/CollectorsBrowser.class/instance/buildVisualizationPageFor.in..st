building - visualization - deprecated
buildVisualizationPageFor: aCollector in: aPresentation
	| tab |
	tab := aPresentation tabulator.
	tab title: 'Back In Time'.
	tab
		with: [ :browser | 
			browser
				row: [ :r | 
					r
						column: #items span: 1;
						column: #itemInspector span: 3 ].
			browser
				row: [ :r | 
					r
						column: #nodeStack;
						column: #visu ].
			browser row: #inspector.

			"Display the deep collected items"
			browser transmit
				to: #items;
				andShow: [ :a | 
					a title: 'Collected expressions'.
					a fastTable
						display: aCollector omniscientCollectedItems;
						column: 'Evaluated Expression' evaluated: [ :each | each node source copyFrom: each node start to: each node stop ] width: 250;
						column: 'Collected Object' evaluated: [ :each | each collectedObject ] width: 250 ].

			"Inspect the selected item"
			browser transmit
				from: #items;
				to: #itemInspector;
				andShow: [ :a :item | (a custom: CollectorBrowserInspector new) startOn: item ].

			"Transmit the selected item to the stack and its visualization"
			browser transmit
				from: #items;
				to: #nodeStack;
				andShow: [ :a :item | 
					a title: 'Collected sub-expressions'.
					a fastTable
						tagsStyle: #greenRoundedButton;
						display:
							(item backInTimeItems reversed
								addFirst: item;
								yourself);
						column: 'Expression Stack'
							evaluated: [ :each | 
							| subNode |
							subNode := each node.
							subNode source copyFrom: subNode start to: subNode stop ]
							tags: [ :each | 
								each oldValue = each newValue
									ifFalse: [ 'value change' ]
									ifTrue: [ #() ] ];
						column: 'Old Value' evaluated: [ :each | each oldValue ] width: 70;
						column: 'New Value' evaluated: [ :each | each newValue ] width: 70;
						column: 'Collected Object' evaluated: [ :each | each collectedObject ] width: 70 ].

			"Transmit the selected item node the visualization"
			browser transmit
				from: #items;
				to: #visu;
				andShow: [ :a :item | 
					self buildItemSegmentFor: item node.
					self nodeVisu: item node in: a ].

			"Transmit the selected stacked item to the visualization"
			browser transmit
				from: #nodeStack;
				to: #visu;
				andShow: [ :a :item | 
					item
						ifNotNil: [ self buildStackedItemSegmentFor: item node.
							self nodeVisu: item node in: a ] ].

			"Transmit the selected stacked item to the stacked item inspector"
			browser transmit
				from: #nodeStack;
				to: #inspector;
				andShow: [ :a :item | (a custom: CollectorBrowserInspector new) startOn: item ] ]