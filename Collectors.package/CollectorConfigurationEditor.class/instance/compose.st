building
compose
	| tab |
	tab := self tabulator.
	tab title: 'Configuration'.
	tab
		with: [ :browser | 
			browser
				row: [ :r | 
					r
						column: #collectorDefinition;
						column: #reifications ];
				row: [ :r | 
					r
						column: #conditions;
						column: #selectedCondition ];
				row: [ :r | 
					r
						column: #transformations;
						column: #selectedTransformation ] ].
	tab transmit
		to: #collectorDefinition;
		andShow: [ :a | collector buildInComposite: a ].
	tab transmit
		to: #reifications;
		andShow: [ :presentation :col | self buildReificationsCheckBoxesIn: presentation ].
	self buildConditionsIn: tab.
	self buildTransformatiosIn: tab