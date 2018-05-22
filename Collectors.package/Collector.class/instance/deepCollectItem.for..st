behavior
deepCollectItem: anItem for: aTopLevelNode
	(self deepCollectedItems at: aTopLevelNode ifAbsentPut: [ OrderedCollection new ])
		add: anItem