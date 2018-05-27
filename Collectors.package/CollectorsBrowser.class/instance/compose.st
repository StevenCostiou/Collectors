building
compose
	| pager |
	self updateCollectorList.
	pager := self pager.
	pager fixedSizePanes: 1.
	pager showFirst: [ :a | self buildCollectorsListIn: a ].
	pager show: [ :a :col | selectedCollector := col. self buildConfigurationPageIn: a ]