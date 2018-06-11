building - configuration
buildConfigurationPageIn: aPresentation
	| tab |
	tab := aPresentation tabulator.
	tab act: [ self update ] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Refresh' .
	tab title: 'Configuration of : ' , selectedCollector printDefinition.
	tab
		with: [ :browser | 
			browser
				row: #installButton span: 1;
				row: [ :r | 
					r
						column: #collectorDefinition;
						column: #reifications ]
					span: 3;
				row: [ :r | 
					r
						column: #conditions;
						column: #selectedCondition ]
					span: 3;
				row: [ :r | 
					r
						column: #transformations;
						column: #selectedTransformation ]
					span: 3 ].
	tab transmit
		to: #collectorDefinition;
		andShow: [ :a | selectedCollector buildInComposite: a ].
	tab transmit
		to: #reifications;
		andShow: [ :presentation | self buildReificationsCheckBoxesIn: presentation ].
	self buildConditionsIn: tab.
	self buildTransformationsIn: tab.
	self buildInstallButtonIn: tab