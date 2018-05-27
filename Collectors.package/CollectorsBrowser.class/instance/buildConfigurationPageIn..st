building
buildConfigurationPageIn: aPresentation
	| tab |
	tab := aPresentation tabulator.
	tab title: 'Configuration of : ' , selectedCollector printDefinition.
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
		andShow: [ :a :col | col buildInComposite: a ].
	tab transmit
		to: #reifications;
		andShow: [ :presentation :col | self buildReificationsCheckBoxesIn: presentation for: col ].
	self buildConditionsIn: tab.
	self buildTransformatiosIn: tab.