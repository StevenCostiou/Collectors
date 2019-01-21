building
compose
	| pager |
	self updateCollectorList.
	pager := self pager.
	pager fixedSizePanes: 1.
	pager showFirst: [ :a | self buildCollectorsListIn: a ].
	pager
		show: [ :a :col | 
			self selectedCollector: col.
			self buildCollectPointsVisualizationIn: a.
			self buildConfigurationPageIn: a ]