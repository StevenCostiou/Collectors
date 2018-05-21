as yet unclassified
buildConfigurationPageIn: aPresentation
	
			| tab |
			tab := aPresentation tabulator.
			tab
				with: [ :browser | 
					browser
						row: [ :r | 
							r
								column: #collectors;
								column: #definition ].
					browser row: [ :r | r column: #toto ].
					self collectorsBrowserOn: browser ]