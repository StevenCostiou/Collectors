building
buildConfigurationPageFor: aCollector in: aPresentation
	| tab |
	tab := aPresentation tabulator.
	tab title: 'Configuration of : ' , aCollector printDefinition.
	tab
		with: [ :browser | 
			browser
				row: [ :r | 
					r
						column: #collectorDefinition;
						column: #options ].
			browser row: #conditions.
			browser row: #transformations ].
	tab transmit
		to: #collectorDefinition;
		andShow: [ :a :col | col buildInComposite: a ].
	tab transmit
		to: #conditions;
		andShow:aCollector configuration conditions