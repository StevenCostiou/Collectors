building - collectPoints visualization
buildCollectPointsVisualizationIn: aPresentation
	| tab |
	tab := aPresentation tabulator.
	tab title: 'Collect points of : ' , selectedCollector printDefinition.
	tab act: [ self update ] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Refresh' .
	tab
		with: [ :browser | 
			browser
				row: [ :r | 
					r
						column: #itemNodes span: 1;
						column: #collectionTime span: 1;
						column: #itemSource span: 2 ]
				span: 4.
			browser row: #itemStack span: 4.
			browser row: #actions span: 1 ].
	self buildNodesVsualizationIn: tab.
	self buildItemStackIn: tab.